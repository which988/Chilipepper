#include "chilipepper.h"
#include "xparameters.h"
#include "xstatus.h"
#include "xil_printf.h"
#include "xbasic_types.h"
#include <math.h>

#define TARGET_RSSI 800
#define TARGET_RSSI_MARGIN 50

// mcu registers
Xuint32 *chili_init_done, *chili_pa_en, *chili_tr_sw, *chili_mcu_reset, *chili_rx_en, *chili_tx_en;
// DAC registers
Xuint32 *dac_en;
// tx registers
Xuint32 *clear_fifo, *tx_en, *tx_done, *tx_fifo;

/////////////////////////////////////////////////////////////////////////////////////////////
// Initialize
/////////////////////////////////////////////////////////////////////////////////////////////
int Chilipepper_Initialize( void )
{

// MCU core
	chili_init_done = (Xuint32 *)(0x61600000 + 0x800);
	chili_pa_en = (Xuint32 *)(0x61600000 + 0x800);
	chili_tr_sw = (Xuint32 *)(0x61600000 + 0x804);
	chili_mcu_reset = (Xuint32 *)(0x61600000 + 0x808);
	chili_rx_en = (Xuint32 *)(0x61600000 + 0x80C);
	chili_tx_en = (Xuint32 *)(0x61600000 + 0x810);

	    // enable Tr/Rx cores in the RFIC
	    *chili_rx_en = 1;
	    *chili_tx_en = 1;

	    // toggle reset on MCU - active low
	    *chili_mcu_reset = 1;
	    *chili_mcu_reset = 0;
	    *chili_mcu_reset = 1;

	    // wait for the MCU to finish calibration
	    while(*chili_init_done == 0)
	    	;

	    // put RF front-end in state for receive
	    *chili_pa_en = 0; // active high
	    *chili_tr_sw = 1; // 0- transmit, 1-receive

	return 0;
}
/////////////////////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////////////////////
// Check to see if onboard calibration has finished
/////////////////////////////////////////////////////////////////////////////////////////////
int Chilipepper_InitDone( void )
{
	int done;
	done = *chili_init_done;
	return done;
}
/////////////////////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////////////////////
// reset the board
/////////////////////////////////////////////////////////////////////////////////////////////
void Chilipepper_Reset( void )
{
    // reset Chilipepper
	*chili_mcu_reset = 1;
	*chili_mcu_reset = 0;
	*chili_mcu_reset = 1;
    // don't continue until we get a valid init back from Chilipepper.
    while(Chilipepper_InitDone()==0)
        ;
}
/////////////////////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////////////////////
// set the transmit/receive switch
/////////////////////////////////////////////////////////////////////////////////////////////
void Chilipepper_SetTxRxSw( int zeroTxOneRx )
{
	// 0- transmit, 1-receive - defaults to Rx if input not zero
	if (zeroTxOneRx==0)
	    *chili_tr_sw = 0; // Tx
	else
	    *chili_tr_sw = 1; // Rx
}
/////////////////////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////////////////////
// enable or disable the Tx PA
/////////////////////////////////////////////////////////////////////////////////////////////
void Chilipepper_SetPA(int onOff)
{
	// if not 1 then some other value so for safety disable PA
	if (onOff==1)
	    *chili_pa_en = 1; // active high
	else
	    *chili_pa_en = 0; // active high
}
/////////////////////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////////////////////
// enable or disable the Tx portion of the transceiver
/////////////////////////////////////////////////////////////////////////////////////////////
void Chilipepper_TxEnable(int onOff)
{
	if (onOff==1)
	    *chili_tx_en = 1; // active high
	else
	    *chili_tx_en = 0; // active high
}
/////////////////////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////////////////////
// enable or disable the Rx portion of the transceiver
/////////////////////////////////////////////////////////////////////////////////////////////
void Chilipepper_RxEnable(int onOff)
{
	if (onOff==1)
	    *chili_rx_en = 1; // active high
	else
	    *chili_rx_en = 0; // active high

}
/////////////////////////////////////////////////////////////////////////////////////////////

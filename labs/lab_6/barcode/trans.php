<?php

function codabar_ch ( $arg ) {
    $retval = '08:0'; //старт символ
    for ( $i =0; $i < strlen ($arg); $i++) {
	switch ( $arg{$i} ) {
	case '0':
		$retval .= '0082';
		break;
	case '1':
	        $retval .= '00:0';
		break;
	case '2':
                $retval .= '0802';
		break;
	case '3':
                $retval .= ':000';
		break;
	case '4':
                $retval .= '0280';
		break;
	case '5':
                $retval .= '2080';
		break;
	case '6':
                $retval .= '8002';
		break;
	case '7':
                $retval .= '8020';
		break;
	case '8':
                $retval .= '8200';
		break;
	case '9':
                $retval .= '2800';
		break;
	case '-':
                $retval .= '0820';
		break;
	case '$':
                $retval .= '0:00';
		break;
	case ':':
                $retval .= '2022';
		break;
	case '/':
                $retval .= '2202';
		break;
	case '.':
                $retval .= '2220';
		break;
	case '+':
                $retval .= '0222';
		break;
	}
    }
    $retval .= '08:0'; //стоп символ
    return $retval;
}

function code39_ch ($arg) {
    $retval = '80220'; //старт символ
    for ( $i =0; $i < strlen ($arg); $i++) {
	switch ( $arg{$i} ) {
	case '0':
		$retval .= '08220';
		break;
	case '1':
	        $retval .= '28002';
		break;
	case '2':
                $retval .= '0:002';
		break;
	case '3':
                $retval .= '2:000';
		break;
	case '4':
                $retval .= '08202';
		break;
	case '5':
                $retval .= '28200';
		break;
	case '6':
                $retval .= '0:200';
		break;
	case '7':
                $retval .= '08022';
		break;
	case '8':
                $retval .= '28020';
		break;
	case '9':
                $retval .= '0:020';
		break;
	case '-':
                $retval .= '80022';
		break;
	case '$':
                $retval .= '88800';
		break;
	case ' ':
                $retval .= '82020';
		break;
	case '/':
                $retval .= '88080';
		break;
	case '.':
                $retval .= ':0020';
		break;
	case '+':
                $retval .= '80880';
		break;
	case '%':
                $retval .= '08880';
		break;
	case 'A':
                $retval .= '20802';
		break;
	case 'B':
                $retval .= '02802';
		break;
	case 'C':
                $retval .= '22800';
		break;
	case 'D':
                $retval .= '00:02';
		break;
	case 'E':
                $retval .= '20:00';
		break;
	case 'F':
                $retval .= '02:00';
		break;
	case 'G':
                $retval .= '00822';
		break;
	case 'H':
                $retval .= '20820';
		break;
	case 'I':
                $retval .= '02820';
		break;
	case 'J':
                $retval .= '00:20';
		break;
	case 'K':
                $retval .= '20082';
		break;
	case 'L':
                $retval .= '02082';
		break;
	case 'M':
                $retval .= '22080';
		break;
	case 'N':
                $retval .= '00282';
		break;
	case 'O':
                $retval .= '20280';
		break;
	case 'P':
                $retval .= '02280';
		break;
	case 'Q':
		$retval .= '000:2';
		break;
	case 'R':
                $retval .= '200:0';
		break;
	case 'S':
                $retval .= '020:0';
		break;
	case 'T':
                $retval .= '002:0';
		break;
	case 'U':
                $retval .= ':0002';
		break;
	case 'V':
		$retval .= '82002';
		break;
	case 'W':
                $retval .= ':2000';
		break;
	case 'X':
                $retval .= '80202';
		break;
	case 'Y':
                $retval .= ':0200';
		break;
	case 'Z':
                $retval .= '82200';
		break;
	}
	}
    $retval .= '80220'; //стоп символ
    return $retval;
}

?>

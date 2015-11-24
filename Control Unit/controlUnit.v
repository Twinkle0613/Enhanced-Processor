//Siah Yi Loi
module controlUnit //declare o/p & i/p
(
	input CLOCK_50, reset, Enter,
	//status signals
	input [2:0]IR,
	input Aeq0, Apos,
	//control signals
	output reg IRload, JMPmux, PCload, Meminst, MemWr, Aload, Sub, Halt,
	output reg [1:0]Asel,
	output wire [3:0]DisplayState
);

//declare the state's name
parameter start = 4'b0000, fetch = 4'b0001, decode = 4'b0010;
parameter load = 4'b1000, store = 4'b1001, add= 4'b1010;
parameter sub = 4'b1011, manInput = 4'b1100, jz = 4'b1101;
parameter jpos = 4'b1110, halt = 4'b1111;

reg [3:0] n_state, state;

assign DisplayState = state;

//**********Code start HERE****************************
//asynchronous clock and reset
always@(posedge CLOCK_50, negedge reset)
	if(!reset)
		state <= start;
	else
		state <= n_state;
		
//indicating the next state
always@(state, Enter, IR, Aeq0, Apos)
begin
	case(state)
	start:	n_state = fetch;
	fetch:	n_state = decode;
	decode:	begin
				case(IR)
				3'b000: n_state = load;
				3'b001: n_state = store;
				3'b010: n_state = add;
				3'b011: n_state = sub;
				3'b100: n_state = manInput;
				3'b101: n_state = jz;
				3'b110: n_state = jpos;
				3'b111: n_state = halt;
				default: n_state = halt;
				endcase
			end
	load:	n_state = start;
	store:	n_state = start;
	add:	n_state = start;
	sub:	n_state = start;
	manInput:if(Enter)
				n_state = start;
			 else
			 	n_state = manInput;
	jz:		n_state = start;
	jpos:	n_state = start;
	halt: 	n_state = halt;
	default:n_state = start;
	endcase
end

always@(state, Aeq0, Apos)
begin
	case(state)
	start:	begin IRload=0; JMPmux=0; PCload=0; Meminst=0; MemWr=0; Asel=2'b00; Aload=0; Sub=0; Halt=0; end
	fetch:	begin IRload=1; JMPmux=0; PCload=1; Meminst=0; MemWr=0; Asel=2'b00; Aload=0; Sub=0; Halt=0; end
	decode:	begin IRload=0; JMPmux=0; PCload=0; Meminst=1; MemWr=0; Asel=2'b00; Aload=0; Sub=0; Halt=0; end
	load:	begin IRload=0; JMPmux=0; PCload=0; Meminst=0; MemWr=0; Asel=2'b10; Aload=1; Sub=0; Halt=0; end
	store:	begin IRload=0; JMPmux=0; PCload=0; Meminst=1; MemWr=1; Asel=2'b00; Aload=0; Sub=0; Halt=0; end
	add:	begin IRload=0; JMPmux=0; PCload=0; Meminst=0; MemWr=0; Asel=2'b00; Aload=1; Sub=0; Halt=0; end
	sub:	begin IRload=0; JMPmux=0; PCload=0; Meminst=0; MemWr=0; Asel=2'b00; Aload=1; Sub=1; Halt=0; end
	manInput:begin IRload=0; JMPmux=0; PCload=0; Meminst=0; MemWr=0; Asel=2'b01; Aload=1; Sub=0; Halt=0; end
	jz:		begin IRload=0; JMPmux=1; PCload=Aeq0; Meminst=0; MemWr=0; Asel=2'b00; Aload=0; Sub=0; Halt=0; end
	jpos:	begin IRload=0; JMPmux=1; PCload=Apos; Meminst=0; MemWr=0; Asel=2'b00; Aload=0; Sub=0; Halt=0; end
	halt:	begin IRload=0; JMPmux=0; PCload=0; Meminst=0; MemWr=0; Asel=2'b00; Aload=0; Sub=0; Halt=1; end
	endcase
end

endmodule

	
	
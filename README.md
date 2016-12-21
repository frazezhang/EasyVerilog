# EasyVerilog

##关于parameter
module，bus,struct都可以有参数，类似于C++的模板<>


##关于数据类型
    u1
    s2
    s16
    u13
    u<15>
    s<PARA>

    u8[5][4][3]
    s<32>[PA][PB][PC]


    struct COMP<type T, int I > {
      assert () {
        T in （u1, u3）
    }
      u8	A
      u<I>		B
      T	C
    }


##关于bus

    bus bRAM<type TYPE=u1, int DEPTH=1> {
      assert(DEPTH>0)
      assert(TYPE in (u1, u3, u5))
      assert($bit_width(TYPE) < 10 )
      fdir	u<$clog2(DEPTH)>	a
      fdir	TYPE				d
      bdir TYPE				q
      fdir u1					cen
      fdir	u1					wen
    }				


    bus bAXI<> {

    }

##关于module

每个module放在一个文件中(*.evm)，文件名就是module名



##关于instance
先instance再连接端口

BlockA<p1Value,p2Value> 	blkA
BlockB<P1=12，P2=32>	blkB

    // 带前缀的模式
    bond () {
    this.clk->blkA.clk
    this.arst_n->blkA.arst_n

    blkA.RAM->blkB.RAM
    }

    //不带前缀的模式
    bond (blkA:::blkB) {
      .RAM->.RAM
      .FIFO<-		fifo<5>		<-.FIFO		// 中间接一个深度为5的FIFO
      .* -> .*	//连接blkA所有output同类型，到blkB所有input
        .* <- .*
    }

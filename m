Return-Path: <meta-arago@emagii.com>
Received: from smtp-out21.han.skanova.net (smtp-out21.han.skanova.net
	[195.67.226.208])
	by arago-project.org (Postfix) with ESMTP id 0F87552A72
	for <meta-arago@arago-project.org>;
	Thu,  3 Jul 2014 06:23:44 +0000 (UTC)
Received: from [10.175.196.23] (213.66.90.56) by smtp-out21.han.skanova.net
	(8.5.133) (authenticated as u82406562)
	id 53804BED00F6B5EA; Thu, 3 Jul 2014 08:23:41 +0200
Message-ID: <53B4F6EC.6070606@emagii.com>
Date: Thu, 03 Jul 2014 08:23:40 +0200
From: Ulf Samuelsson <meta-arago@emagii.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: "Cooper Jr., Franklin" <fcooper@ti.com>, 
	"Dmytriyenko, Denys" <denys@ti.com>
References: <53B44965.5050502@emagii.com>
	<53B449D5.30600@emagii.com>	<20140702181315.GA15788@edge>
	<53B459CC.20805@emagii.com>	<20140702191802.GB15788@edge>
	<53B45C0A.60805@emagii.com>
	<8F29D6B095ED194EA1980491A5E029710C6DA912@DFLE08.ent.ti.com>
	<53B46ADA.1070400@emagii.com>
	<8F29D6B095ED194EA1980491A5E029710C6DAA36@DFLE08.ent.ti.com>
In-Reply-To: <8F29D6B095ED194EA1980491A5E029710C6DAA36@DFLE08.ent.ti.com>
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Color output (was: Build of qtbase fails due to no OpenGL libraries, but completes after cleaning qtbase)
X-BeenThere: meta-arago@arago-project.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Arago metadata layer for TI SDKs - OE-Core/Yocto compatible
	<meta-arago.arago-project.org>
List-Unsubscribe: <http://arago-project.org/cgi-bin/mailman/options/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=unsubscribe>
List-Archive: <http://arago-project.org/pipermail/meta-arago>
List-Post: <mailto:meta-arago@arago-project.org>
List-Help: <mailto:meta-arago-request@arago-project.org?subject=help>
List-Subscribe: <http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=subscribe>
X-List-Received-Date: Thu, 03 Jul 2014 06:23:44 -0000
Content-Type: multipart/alternative;
	boundary="------------070503010908030603090205"

--------------070503010908030603090205
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

 >> One issue which I need to investigate, is the colours.
 >> At boot, the Penguin appears with Blue feet, and not Yellow/Orange 
and the
 >> customer splash screen and applications also have the wrong colour.

 > [Franklin] I believe that color issue has to-do with the am335x errata
 >    (http://www.ti.com/lit/er/sprz360f/sprz360f.pdf (page 8). )
 > The BBB is hooked up to display correctly in 16bpp mode but if you 
use 24bpp then your colors will look messed up.
 > I recommend posting this question to e2e.ti.com and the right people 
can help you with this.

Did a posting there, yet to get a reply, so I am posting here as well.


My custom device-tree file was based on the LCD4 device tree files. Some 
excerpts:


         lcdc: lcdc@0x4830e000 {
             compatible = "ti,am33xx-tilcdc";
             reg = <0x4830e000 0x1000>;
             interrupt-parent = <&intc>;
             interrupts = <36>;
             clocks = <&lcd_gclk>;
             clock-names = "fck";
             ti,hwmods = "lcdc";
             status = "okay";
         };

/* fbdev entry */
&lcdc {
     pinctrl-names = "default";
     pinctrl-0 = <&bone_lcd4_cape_lcd_pins>;
     status = "okay";
     display-timings {
         480x272 {
             clock-frequency = <9000000>;
             hactive         = <480>;
             vactive         = <272>;
             hfront-porch    = <9>;
             hback-porch     = <44>;
             hsync-len       = <5>;
             vback-porch     = <13>;
             vfront-porch    = <4>;
             vsync-len       = <10>;
             hsync-active    = <0>;
             vsync-active    = <0>;
         };
     };
};

Any view on the correctness of this?

"omaplfb" loads with this. Is this because it (compatible = "ti") is true?
The "tilcdc" driver is not even compiled.

Is there any documentation on device tree bindings for the "omaplfb"?

Meanwhile, I am adding 'bpp = <16>;' based on other examples

         lcdc: lcdc@0x4830e000 {
             compatible = "ti,am33xx-tilcdc";
             reg = <0x4830e000 0x1000>;
             interrupt-parent = <&intc>;
             interrupts = <36>;
             bpp = <16>;
             clocks = <&lcd_gclk>;
             clock-names = "fck";
             ti,hwmods = "lcdc";
             status = "okay";
         };

BR
Ulf Samuelsson


--------------070503010908030603090205
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=ISO-8859-1"
      http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    &gt;&gt; One issue which I need to investigate, is the colours.
    <big><br>
    </big>&gt;&gt; At boot, the Penguin appears with Blue feet, and not
    Yellow/Orange and the
    <big><br>
    </big>&gt;&gt; customer splash screen and applications also have the
    wrong colour.
    <big><br>
      <br>
    </big>&gt; [Franklin] I believe that color issue has to-do with the
    am335x errata <br>
    &gt;&nbsp;&nbsp;&nbsp; (<a class="moz-txt-link-freetext" href="http://www.ti.com/lit/er/sprz360f/sprz360f.pdf">http://www.ti.com/lit/er/sprz360f/sprz360f.pdf</a> (page 8). <big>)<br>
    </big>&gt; The BBB is hooked up to display correctly in 16bpp mode
    but if you use 24bpp then your colors will look messed up.
    <br>
    &gt; I recommend posting this question to e2e.ti.com and the right
    people can help you with this.
    <br>
    <br>
    Did a posting there, yet to get a reply, so I am posting here as
    well.<br>
    <br>
    <br>
    My custom device-tree file was based on the LCD4 device tree files.
    Some excerpts:<br>
    <br>
    <br>
    &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; lcdc: lcdc@0x4830e000 {<br>
    &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; compatible = "ti,am33xx-tilcdc";<br>
    &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; reg = &lt;0x4830e000 0x1000&gt;;<br>
    &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; interrupt-parent = &lt;&amp;intc&gt;;<br>
    &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; interrupts = &lt;36&gt;;<br>
    &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; clocks = &lt;&amp;lcd_gclk&gt;;<br>
    &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; clock-names = "fck";<br>
    &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; ti,hwmods = "lcdc";<br>
    &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; status = "okay";<br>
    &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; };<br>
    <br>
    /* fbdev entry */<br>
    &amp;lcdc {<br>
    &nbsp;&nbsp;&nbsp; pinctrl-names = "default";<br>
    &nbsp;&nbsp;&nbsp; pinctrl-0 = &lt;&amp;bone_lcd4_cape_lcd_pins&gt;;<br>
    &nbsp;&nbsp;&nbsp; status = "okay";<br>
    &nbsp;&nbsp;&nbsp; display-timings {<br>
    &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; 480x272 {<br>
    &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; clock-frequency = &lt;9000000&gt;;<br>
    &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; hactive&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; = &lt;480&gt;;<br>
    &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; vactive&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; = &lt;272&gt;;<br>
    &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; hfront-porch&nbsp;&nbsp;&nbsp; = &lt;9&gt;;<br>
    &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; hback-porch&nbsp;&nbsp;&nbsp;&nbsp; = &lt;44&gt;;<br>
    &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; hsync-len&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; = &lt;5&gt;;<br>
    &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; vback-porch&nbsp;&nbsp;&nbsp;&nbsp; = &lt;13&gt;;<br>
    &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; vfront-porch&nbsp;&nbsp;&nbsp; = &lt;4&gt;;<br>
    &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; vsync-len&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; = &lt;10&gt;;<br>
    &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; hsync-active&nbsp;&nbsp;&nbsp; = &lt;0&gt;;<br>
    &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; vsync-active&nbsp;&nbsp;&nbsp; = &lt;0&gt;;<br>
    &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; };<br>
    &nbsp;&nbsp;&nbsp; };<br>
    };<br>
    <br>
    Any view on the correctness of this?<br>
    <br>
    "omaplfb" loads with this. Is this because it (compatible = "ti")&nbsp;
    is true?<br>
    The "tilcdc" driver is not even compiled.<br>
    <br>
    Is there any documentation on device tree bindings for the
    "omaplfb"?<br>
    <br>
    Meanwhile, I am adding 'bpp = &lt;16&gt;;' based on other examples<br>
    <br>
    &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; lcdc: lcdc@0x4830e000 {<br>
    &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; compatible = "ti,am33xx-tilcdc";<br>
    &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; reg = &lt;0x4830e000 0x1000&gt;;<br>
    &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; interrupt-parent = &lt;&amp;intc&gt;;<br>
    &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; interrupts = &lt;36&gt;;<br>
    &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; bpp = &lt;16&gt;;<br>
    &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; clocks = &lt;&amp;lcd_gclk&gt;;<br>
    &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; clock-names = "fck";<br>
    &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; ti,hwmods = "lcdc";<br>
    &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; status = "okay";<br>
    &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; };<br>
    <br>
    BR<br>
    Ulf Samuelsson<br>
    <br>
  </body>
</html>

--------------070503010908030603090205--

Return-Path: <ankur.tyagi85@gmail.com>
Received: from mail-vk0-f53.google.com (mail-vk0-f53.google.com
	[209.85.213.53])
	by arago-project.org (Postfix) with ESMTPS id 9C430529F8
	for <meta-arago@arago-project.org>;
	Wed,  2 Sep 2015 04:00:06 +0000 (UTC)
Received: by vkhf67 with SMTP id f67so69191759vkh.1
	for <meta-arago@arago-project.org>;
	Tue, 01 Sep 2015 21:00:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:from:date:message-id:subject:to:content-type;
	bh=f3Q/qQP/XLyzYOCRMipmmyGJQeshAiobUuUh4rsPQNw=;
	b=cTXpKz6xAFLN3hX9DFEQskoYJRrtYVIDZ5WLhPMiBzcSdS57nOG+ZjWRLZyVWw3rCG
	S6ySiOmvzy7iwDdDUWZzVt6nSPhnb0Z10xdBrA2qwhRBRINdVLuitu66zauoK9+k+rUf
	v/AzvuLSorb4yldlosn5ZUWpeiC4nfo+ds2b7qVKQev1uqUjh79Y/IJiLDgF2SNNzLSr
	Pq4ucGmtV1qJqXPZnXwr2gEOs207VU8HD3S/ZQ2Mq1KlwgP0ZEixC+dP8zWhnIpIVAkB
	OFHjAkZ6g6Vy4ngHa0DHtS/rmfgmOofyJOuQDxZJAtya/rbtSRCF4su5j74VeBHm5WtU
	6MyQ==
X-Received: by 10.53.11.226 with SMTP id el2mr35696913vdd.37.1441166405794;
	Tue, 01 Sep 2015 21:00:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.201.130 with HTTP; Tue, 1 Sep 2015 20:59:46 -0700 (PDT)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Wed, 2 Sep 2015 15:59:46 +1200
Message-ID: <CADySD0GtpTGt+5mWrofmk5EBSxPAC1+kJo3piYKUY9+=Srq9xA@mail.gmail.com>
To: meta-arago@arago-project.org
Subject: Using 1GB Nand with AM335x
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
X-List-Received-Date: Wed, 02 Sep 2015 04:00:06 -0000
Content-Type: multipart/alternative; boundary=001a11360486ae01e1051ebbb3db

--001a11360486ae01e1051ebbb3db
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,

I have following queries regarding usage of 1GB Nand (MT29F8G16ABACAWP)
with AM335x

- what is the meaning of cells in "reg" property of gpmc nand child node ?
Information here is not clear
http://lxr.free-electrons.com/source/Documentation/devicetree/bindings/mtd/=
gpmc-nand.txt?v=3D3.14

- what should be the value of property "gpmc,device-width" if
"nand-bus-width=3D <16>" ? I think it should be "2"


Please confirm whether below is correct for 1GB 16-bit bus-width nand

&gpmc {
	status =3D "okay";
	pinctrl-names =3D "default", "sleep";
	pinctrl-0 =3D <&nandflash_pins_default>;
	pinctrl-1 =3D <&nandflash_pins_sleep>;
	ranges =3D <0 0 0x08000000 0x40000000>;	/* CS0: NAND */
	nand@0,0 {
		reg =3D <0 0 0>; /* CS0, offset 0 */
		ti,nand-ecc-opt =3D "bch16";
		ti,elm-id =3D <&elm>;
		nand-bus-width =3D <16>;
		gpmc,device-width =3D <2>;
		#address-cells =3D <1>;
		#size-cells =3D <1>;
		partition@0 {
			label =3D "NAND.SPL";
			reg =3D <0x00000000 0x000040000>;
		};
		partition@1 {
			label =3D "NAND.SPL.backup1";
			reg =3D <0x00040000 0x00040000>;
		};
		partition@2 {
			label =3D "NAND.SPL.backup2";
			reg =3D <0x00080000 0x00040000>;
		};
		partition@3 {
			label =3D "NAND.SPL.backup3";
			reg =3D <0x000c0000 0x00040000>;
		};
		partition@4 {
			label =3D "NAND.u-boot-spl-os";
			reg =3D <0x00100000 0x00080000>;
		};
		partition@5 {
			label =3D "NAND.u-boot";
			reg =3D <0x00180000 0x00200000>;
		};
		partition@6 {
			label =3D "NAND.u-boot-env";
			reg =3D <0x00380000 0x00040000>;
		};
		partition@7 {
			label =3D "NAND.u-boot-env.backup1";
			reg =3D <0x003c0000 0x00040000>;
		};
		partition@8 {
			label =3D "NAND.kernel";
			reg =3D <0x00400000 0x00600000>;
		};
		partition@9 {
			label =3D "NAND.file-system";
			reg =3D <0x00A00000 0x1F600000>;
		};
	}
}


Please also confirm the following arguments for UBIFS :

mkfs.ubifs -r </path/rootfs> -o </path/rootfs.ubifs> -F =E2=80=93m 4096 =E2=
=80=93e
253952 =E2=80=93c 1918
ubinize -o </path/rootfs.ubi> -m 4096 -p 256KiB -s 1024 -O 4096 ubinize.cfg
ubiformat /dev/mtd9 -f rootfs.ubi -s 1024 -O 4096


Thanks

Ankur

--001a11360486ae01e1051ebbb3db
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:georgia,=
serif;font-size:small;color:#333399">Hi,<br></div><div class=3D"gmail_quote=
"><div dir=3D"ltr"><div style=3D"font-family:georgia,serif;font-size:small;=
color:rgb(51,51,153)"><p>I have following queries regarding usage of 1GB Na=
nd (MT29F8G16ABACAWP) with AM335x<br></p><p>- what is the meaning of cells =
in &quot;reg&quot; property of gpmc nand child node ? Information here=C2=
=A0is not clear=C2=A0<a href=3D"http://lxr.free-electrons.com/source/Docume=
ntation/devicetree/bindings/mtd/gpmc-nand.txt?v=3D3.14" target=3D"_blank">h=
ttp://lxr.free-electrons.com/source/Documentation/devicetree/bindings/mtd/g=
pmc-nand.txt?v=3D3.14</a> <br></p><p>- what should be the value of property=
 &quot;gpmc,device-width&quot; if &quot;nand-bus-width=3D &lt;16&gt;&quot; =
? I think it should be &quot;2&quot;<br></p><p><br></p><p>Please confirm wh=
ether below is correct for 1GB 16-bit bus-width nand<br></p><pre>&amp;gpmc =
{
	status =3D &quot;okay&quot;;
	pinctrl-names =3D &quot;default&quot;, &quot;sleep&quot;;
	pinctrl-0 =3D &lt;&amp;nandflash_pins_default&gt;;
	pinctrl-1 =3D &lt;&amp;nandflash_pins_sleep&gt;;
	ranges =3D &lt;0 0 0x08000000 0x40000000&gt;;	/* CS0: NAND */
	nand@0,0 {
		reg =3D &lt;0 0 0&gt;; /* CS0, offset 0 */
		ti,nand-ecc-opt =3D &quot;bch16&quot;;
		ti,elm-id =3D &lt;&amp;elm&gt;;
		nand-bus-width =3D &lt;16&gt;;
		gpmc,device-width =3D &lt;2&gt;;
		#address-cells =3D &lt;1&gt;;
		#size-cells =3D &lt;1&gt;;
		partition@0 {
			label =3D &quot;NAND.SPL&quot;;
			reg =3D &lt;0x00000000 0x000040000&gt;;
		};
		partition@1 {
			label =3D &quot;NAND.SPL.backup1&quot;;
			reg =3D &lt;0x00040000 0x00040000&gt;;
		};
		partition@2 {
			label =3D &quot;NAND.SPL.backup2&quot;;
			reg =3D &lt;0x00080000 0x00040000&gt;;
		};
		partition@3 {
			label =3D &quot;NAND.SPL.backup3&quot;;
			reg =3D &lt;0x000c0000 0x00040000&gt;;
		};
		partition@4 {
			label =3D &quot;NAND.u-boot-spl-os&quot;;
			reg =3D &lt;0x00100000 0x00080000&gt;;
		};
		partition@5 {
			label =3D &quot;NAND.u-boot&quot;;
			reg =3D &lt;0x00180000 0x00200000&gt;;
		};
		partition@6 {
			label =3D &quot;NAND.u-boot-env&quot;;
			reg =3D &lt;0x00380000 0x00040000&gt;;
		};
		partition@7 {
			label =3D &quot;NAND.u-boot-env.backup1&quot;;
			reg =3D &lt;0x003c0000 0x00040000&gt;;
		};
		partition@8 {
			label =3D &quot;NAND.kernel&quot;;
			reg =3D &lt;0x00400000 0x00600000&gt;;
		};
		partition@9 {
			label =3D &quot;NAND.file-system&quot;;
			reg =3D &lt;0x00A00000 0x1F600000&gt;;
		};
	}
}</pre><p><br></p><p>Please also confirm the following arguments for UBIFS =
:<br></p><pre>mkfs.ubifs -r &lt;/path/rootfs&gt; -o &lt;/path/rootfs.ubifs&=
gt; -F =E2=80=93m 4096 =E2=80=93e 253952 =E2=80=93c 1918
ubinize -o &lt;/path/rootfs.ubi&gt; -m 4096 -p 256KiB -s 1024 -O 4096 ubini=
ze.cfg
ubiformat /dev/mtd9 -f rootfs.ubi -s 1024 -O 4096</pre><p><br></p><p>Thanks=
<span class=3D"HOEnZb"><font color=3D"#888888"><br></font></span></p><span =
class=3D"HOEnZb"><font color=3D"#888888"><p>Ankur</p></font></span></div></=
div></div></div>

--001a11360486ae01e1051ebbb3db--

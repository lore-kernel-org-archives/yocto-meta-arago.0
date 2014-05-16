Return-Path: <chase.maupin@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id CFACA52986
	for <meta-arago@arago-project.org>;
	Fri, 16 May 2014 18:40:21 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s4GIeL2n009344
	for <meta-arago@arago-project.org>; Fri, 16 May 2014 13:40:21 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s4GIeL3x007279
	for <meta-arago@arago-project.org>; Fri, 16 May 2014 13:40:21 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.03.0174.001; Fri, 16 May 2014 13:40:21 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Maupin, Chase" <chase.maupin@ti.com>, "Nelson, Sam" <sam.nelson@ti.com>, 
	"meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH] ti-hyplnk: Add recipe for ti hyperlink
	low	level driver
Thread-Index: AQHPcTZJ3Yxti5kcbE+7KM9PFXS6bg==
Date: Fri, 16 May 2014 18:40:19 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1015D0228B1@DLEE11.ent.ti.com>
References: <1393802558-7742-1-git-send-email-sam.nelson@ti.com>
	<7D46E86EC0A8354091174257B2FED1015D022790@DLEE11.ent.ti.com>
In-Reply-To: <7D46E86EC0A8354091174257B2FED1015D022790@DLEE11.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH] ti-hyplnk: Add recipe for ti hyperlink	low	level driver
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
X-List-Received-Date: Fri, 16 May 2014 18:40:22 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

BTW, does this belong in meta-ti instead of meta-arago?


>-----Original Message-----
>From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
>bounces@arago-project.org] On Behalf Of Maupin, Chase
>Sent: Friday, May 16, 2014 1:32 PM
>To: Nelson, Sam; meta-arago@arago-project.org
>Subject: Re: [meta-arago] [PATCH] ti-hyplnk: Add recipe for ti
>hyperlink low level driver
>
>>-----Original Message-----
>>From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
>>bounces@arago-project.org] On Behalf Of Nelson, Sam
>>Sent: Sunday, March 02, 2014 5:23 PM
>>To: meta-arago@arago-project.org
>>Subject: [meta-arago] [PATCH] ti-hyplnk: Add recipe for ti
>>hyperlink low level driver
>>
>>- User space low level driver and test code for hyperlink
>>  peripheral
>>
>>Signed-off-by: Sam Nelson <sam.nelson@ti.com>
>>---
>> .../recipes-bsp/ti-hyplnk/ti-hyplnk-bin_git.bb     |   38
>>++++++++++++++++++++
>> .../recipes-bsp/ti-hyplnk/ti-hyplnk-lib_git.bb     |   21
>>+++++++++++
>> .../recipes-bsp/ti-hyplnk/ti-hyplnk.inc            |   10 ++++++
>> 3 files changed, 69 insertions(+)
>> create mode 100755 meta-arago-extras/recipes-bsp/ti-hyplnk/ti-
>>hyplnk-bin_git.bb
>> create mode 100755 meta-arago-extras/recipes-bsp/ti-hyplnk/ti-
>>hyplnk-lib_git.bb
>> create mode 100644 meta-arago-extras/recipes-bsp/ti-hyplnk/ti-
>>hyplnk.inc
>>
>>diff --git a/meta-arago-extras/recipes-bsp/ti-hyplnk/ti-hyplnk-
>>bin_git.bb b/meta-arago-extras/recipes-bsp/ti-hyplnk/ti-hyplnk-
>>bin_git.bb
>>new file mode 100755
>>index 0000000..9938b18
>>--- /dev/null
>>+++ b/meta-arago-extras/recipes-bsp/ti-hyplnk/ti-hyplnk-
>bin_git.bb
>>@@ -0,0 +1,38 @@
>>+DESCRIPTION =3D "TI HYPLNK low level driver test binaries"
>>+LICENSE =3D "TI BSD"
>
>Include this in the .inc file since it is common between the two.
>Although I might question whether you really need two separate
>recipes and a .inc file or if you could use a single recipe and
>make different packages, i.e. PN and PN-lib
>
>>+
>>+COMPATIBLE_MACHINE =3D "keystone"
>
>Common between both recipes
>
>>+
>>+PR =3D "r0"
>>+DEPENDS=3D"ti-csl ti-hyplnk-lib"
>
>Common between both recipes
>
>>+
>>+include ti-hyplnk.inc
>>+
>>+BASEDIR =3D "${WORKDIR}/git"
>>+S =3D "${BASEDIR}/ti/drv/${LLDNAME}"
>
>Common beween both recipes
>
>>+
>>+DEVICELIST =3D " k2h \
>>+               k2k \
>>+"
>
>If you start using machines per device type do you still want to
>install K2H and K2K binaries and libraries into both or rather
>make this recipe machine specific ARCH and build and install only
>the libraries for that device?
>
>>+
>>+CHOICELIST =3D " yes \
>>+               no  \
>>+"
>
>Can you elaborate on these options here?  Do you really need
>dynamic library and static library versions?  Would it be better
>to package them separately or one as a -dbg package for example?
>
>>+
>>+do_compile () {
>>+	make -f makefile_armv7 clean
>>PDK_INSTALL_PATH=3D${STAGING_INCDIR} HYPLNK_SRC_DIR=3D${PWD}
>
>This use of ${PWD} can cause you problems because it assumes you
>are in a certain directory.  That can be painful when someone
>appends or prepends you.  I would instead use ${S} or some such
>equivalent.
>
>>+	for device in ${DEVICELIST}
>>+	do
>>+		for choice in ${CHOICELIST}
>>+		do
>>+			make -f makefile_armv7 tests examples
>>PDK_INSTALL_PATH=3D${STAGING_INCDIR} DEVICE=3D"${device}"
>>HYPLNK_SRC_DIR=3D${S} USEDYNAMIC_LIB=3D"${choice}"
>>+		done
>>+	done
>>+}
>>+
>>+do_install () {
>>+    for device in ${DEVICELIST}
>>+	do
>>+	    make -f makefile_armv7 installbin
>>PDK_INSTALL_PATH=3D${STAGING_INCDIR} DEVICE=3D"${device}"
>>HYPLNK_SRC_DIR=3D${S} INSTALL_BIN_BASE_DIR=3D${D}/${bindir}
>>+	done
>
>To help with the review can you detail what the resulting
>directory structure and files looks like after this install step?
>
>>+}
>>diff --git a/meta-arago-extras/recipes-bsp/ti-hyplnk/ti-hyplnk-
>>lib_git.bb b/meta-arago-extras/recipes-bsp/ti-hyplnk/ti-hyplnk-
>>lib_git.bb
>>new file mode 100755
>>index 0000000..03399c6
>>--- /dev/null
>>+++ b/meta-arago-extras/recipes-bsp/ti-hyplnk/ti-hyplnk-
>lib_git.bb
>>@@ -0,0 +1,21 @@
>
>I think you can combine this with the previous recipe and just
>make a -lib package.
>
>>+DESCRIPTION =3D "TI HYPLNK Low Level Driver"
>>+LICENSE =3D "TI BSD"
>>+
>>+COMPATIBLE_MACHINE =3D "keystone"
>>+
>>+PR =3D "r0"
>>+DEPENDS=3D"ti-csl"
>>+
>>+include ti-hyplnk.inc
>>+
>>+BASEDIR =3D "${WORKDIR}/git"
>>+S =3D "${BASEDIR}/ti/drv/${LLDNAME}"
>>+
>>+do_compile () {
>>+#   Now build the lld in the updated directory
>>+    make -f makefile_armv7 clean lib
>>PDK_INSTALL_PATH=3D${STAGING_INCDIR}
>>+}
>>+
>>+do_install () {
>>+    make -f makefile_armv7 install
>>PDK_INSTALL_PATH=3D${STAGING_INCDIR}
>>INSTALL_INC_BASE_DIR=3D${D}/${includedir}
>>INSTALL_LIB_BASE_DIR=3D${D}${libdir}
>>+}
>>diff --git a/meta-arago-extras/recipes-bsp/ti-hyplnk/ti-
>hyplnk.inc
>>b/meta-arago-extras/recipes-bsp/ti-hyplnk/ti-hyplnk.inc
>>new file mode 100644
>>index 0000000..26f22db
>>--- /dev/null
>>+++ b/meta-arago-extras/recipes-bsp/ti-hyplnk/ti-hyplnk.inc
>>@@ -0,0 +1,10 @@
>>+LLDNAME=3D"hyplnk"
>>+
>>+LIC_FILES_CHKSUM =3D
>>"file://${WORKDIR}/git/ti/drv/${LLDNAME}/COPYING.txt;md5=3D5bdceac8
>7
>>2dffdec915b819654ee23ea"
>>+
>>+BRANCH=3D"master"
>>+SRC_URI =3D "git://git.ti.com/keystone-rtos/hyplnk-
>>lld.git;destsuffix=3Dgit/ti/drv/${LLDNAME};protocol=3Dgit;branch=3D${BR
>A
>>NCH}"
>>+# Following commit corresponds to tag DEV.HYPLNK_LLD.02.00.00.09
>>+SRCREV =3D "f88e31b60aa2b4d591d5a845361c7e56792eeda1"
>>+
>>+PV =3D "2.0.0"
>>\ No newline at end of file
>>--
>>1.7.9.5
>>
>>_______________________________________________
>>meta-arago mailing list
>>meta-arago@arago-project.org
>>http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
>_______________________________________________
>meta-arago mailing list
>meta-arago@arago-project.org
>http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago


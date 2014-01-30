Return-Path: <chase.maupin@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 0BA9A529BC
	for <meta-arago@arago-project.org>;
	Thu, 30 Jan 2014 16:00:23 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s0UG0LCj007029;
	Thu, 30 Jan 2014 10:00:21 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s0UG0LYu029094;
	Thu, 30 Jan 2014 10:00:21 -0600
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.02.0342.003; Thu, 30 Jan 2014 10:00:21 -0600
From: "Maupin, Chase" <chase.maupin@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH] ipc-test-fw: add FW images version
	3.21.00.02	for IPC tests
Thread-Index: AQHPHWPGugtc6rlehUi1n5xqmAspvZqdbeiQ
Date: Thu, 30 Jan 2014 16:00:20 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED10159939078@DLEE11.ent.ti.com>
References: <1391049214-14245-1-git-send-email-denis@denix.org>
In-Reply-To: <1391049214-14245-1-git-send-email-denis@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH] ipc-test-fw: add FW images version 3.21.00.02	for IPC tests
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
X-List-Received-Date: Thu, 30 Jan 2014 16:00:26 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Acked-by: Chase Maupin <chase.maupin@ti.com>


>-----Original Message-----
>From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
>bounces@arago-project.org] On Behalf Of Denys Dmytriyenko
>Sent: Wednesday, January 29, 2014 8:34 PM
>To: meta-arago@arago-project.org
>Subject: [meta-arago] [PATCH] ipc-test-fw: add FW images version
>3.21.00.02 for IPC tests
>
>From: Denys Dmytriyenko <denys@ti.com>
>
>Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>---
> .../ipc-test-fw/ipc-test-fw_3.21.00.02.bb          | 33
>++++++++++++++++++++++
> 1 file changed, 33 insertions(+)
> create mode 100644 meta-arago-distro/recipes-bsp/ipc-test-fw/ipc-
>test-fw_3.21.00.02.bb
>
>diff --git a/meta-arago-distro/recipes-bsp/ipc-test-fw/ipc-test-
>fw_3.21.00.02.bb b/meta-arago-distro/recipes-bsp/ipc-test-fw/ipc-
>test-fw_3.21.00.02.bb
>new file mode 100644
>index 0000000..41ab2fb
>--- /dev/null
>+++ b/meta-arago-distro/recipes-bsp/ipc-test-fw/ipc-test-
>fw_3.21.00.02.bb
>@@ -0,0 +1,33 @@
>+DESCRIPTION =3D "Firmware images to test IPC"
>+LICENSE =3D "BSD"
>+LIC_FILES_CHKSUM =3D "file://${COREBASE}/meta/files/common-
>licenses/BSD;md5=3D3775480a712fc46a69647678acb234cb"
>+
>+PACKAGE_ARCH =3D "${MACHINE_ARCH}"
>+
>+PR =3D "eng-4-gb9283b0"
>+
>+COMPATIBLE_MACHINE =3D "omap5-evm|dra7xx-evm"
>+
>+INHIBIT_PACKAGE_STRIP =3D "1"
>+INSANE_SKIP_${PN} =3D "arch"
>+
>+S =3D "${WORKDIR}/${PV}_${PR}"
>+
>+SRC_URI =3D "http://arago-project.org/files/releases/ipc-test-
>fw/${PV}_${PR}.tar.gz"
>+
>+SRC_URI[md5sum] =3D "4fcba6844949ea909131684a80233800"
>+SRC_URI[sha256sum] =3D
>"3b90b195c382937551251055aaa9185627e86027c91fb41a594dc390391d5fb6"
>+
>+FW_FILES_omap5-evm =3D "tesla-dsp.xe64T ducati-m3-core0.xem3"
>+FW_FILES_dra7xx-evm =3D "dra7-dsp1-fw.xe66 dra7-dsp2-fw.xe66 dra7-
>ipu1-fw.xem4 dra7-ipu2-fw.xem4"
>+
>+do_compile() {
>+    :
>+}
>+
>+do_install() {
>+    install -d ${D}${base_libdir}/firmware
>+    install -m 755 ${FW_FILES} ${D}${base_libdir}/firmware/
>+}
>+
>+FILES_${PN} +=3D "${base_libdir}/firmware"
>--
>1.8.3.2
>
>_______________________________________________
>meta-arago mailing list
>meta-arago@arago-project.org
>http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago


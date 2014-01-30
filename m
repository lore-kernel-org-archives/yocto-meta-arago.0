Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id CE1E0529BC
	for <meta-arago@arago-project.org>;
	Thu, 30 Jan 2014 17:22:46 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s0UHMkli009182
	for <meta-arago@arago-project.org>; Thu, 30 Jan 2014 11:22:46 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s0UHMjFc019222
	for <meta-arago@arago-project.org>; Thu, 30 Jan 2014 11:22:46 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 30 Jan 2014 11:22:45 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s0UHMj3T021119;
	Thu, 30 Jan 2014 11:22:45 -0600
Date: Thu, 30 Jan 2014 12:22:45 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: "Maupin, Chase" <chase.maupin@ti.com>
Message-ID: <20140130172245.GC6814@edge>
References: <1391049214-14245-1-git-send-email-denis@denix.org>
	<7D46E86EC0A8354091174257B2FED10159939078@DLEE11.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <7D46E86EC0A8354091174257B2FED10159939078@DLEE11.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
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
X-List-Received-Date: Thu, 30 Jan 2014 17:22:47 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

The next question would be in which packagegroup to put it in? Is arago-test a 
good one? Although it's being pulled in for regular rootfs - not sure if that 
would be fine, especially since the images are 5-6 MB each...


On Thu, Jan 30, 2014 at 04:00:20PM +0000, Maupin, Chase wrote:
> Acked-by: Chase Maupin <chase.maupin@ti.com>
> 
> 
> >-----Original Message-----
> >From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> >bounces@arago-project.org] On Behalf Of Denys Dmytriyenko
> >Sent: Wednesday, January 29, 2014 8:34 PM
> >To: meta-arago@arago-project.org
> >Subject: [meta-arago] [PATCH] ipc-test-fw: add FW images version
> >3.21.00.02 for IPC tests
> >
> >From: Denys Dmytriyenko <denys@ti.com>
> >
> >Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> >---
> > .../ipc-test-fw/ipc-test-fw_3.21.00.02.bb          | 33
> >++++++++++++++++++++++
> > 1 file changed, 33 insertions(+)
> > create mode 100644 meta-arago-distro/recipes-bsp/ipc-test-fw/ipc-
> >test-fw_3.21.00.02.bb
> >
> >diff --git a/meta-arago-distro/recipes-bsp/ipc-test-fw/ipc-test-
> >fw_3.21.00.02.bb b/meta-arago-distro/recipes-bsp/ipc-test-fw/ipc-
> >test-fw_3.21.00.02.bb
> >new file mode 100644
> >index 0000000..41ab2fb
> >--- /dev/null
> >+++ b/meta-arago-distro/recipes-bsp/ipc-test-fw/ipc-test-
> >fw_3.21.00.02.bb
> >@@ -0,0 +1,33 @@
> >+DESCRIPTION = "Firmware images to test IPC"
> >+LICENSE = "BSD"
> >+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-
> >licenses/BSD;md5=3775480a712fc46a69647678acb234cb"
> >+
> >+PACKAGE_ARCH = "${MACHINE_ARCH}"
> >+
> >+PR = "eng-4-gb9283b0"
> >+
> >+COMPATIBLE_MACHINE = "omap5-evm|dra7xx-evm"
> >+
> >+INHIBIT_PACKAGE_STRIP = "1"
> >+INSANE_SKIP_${PN} = "arch"
> >+
> >+S = "${WORKDIR}/${PV}_${PR}"
> >+
> >+SRC_URI = "http://arago-project.org/files/releases/ipc-test-
> >fw/${PV}_${PR}.tar.gz"
> >+
> >+SRC_URI[md5sum] = "4fcba6844949ea909131684a80233800"
> >+SRC_URI[sha256sum] =
> >"3b90b195c382937551251055aaa9185627e86027c91fb41a594dc390391d5fb6"
> >+
> >+FW_FILES_omap5-evm = "tesla-dsp.xe64T ducati-m3-core0.xem3"
> >+FW_FILES_dra7xx-evm = "dra7-dsp1-fw.xe66 dra7-dsp2-fw.xe66 dra7-
> >ipu1-fw.xem4 dra7-ipu2-fw.xem4"
> >+
> >+do_compile() {
> >+    :
> >+}
> >+
> >+do_install() {
> >+    install -d ${D}${base_libdir}/firmware
> >+    install -m 755 ${FW_FILES} ${D}${base_libdir}/firmware/
> >+}
> >+
> >+FILES_${PN} += "${base_libdir}/firmware"
> >--
> >1.8.3.2
> >
> >_______________________________________________
> >meta-arago mailing list
> >meta-arago@arago-project.org
> >http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago


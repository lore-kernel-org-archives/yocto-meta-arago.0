Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 7C84E52972
	for <meta-arago@arago-project.org>;
	Mon, 24 Feb 2014 17:44:50 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s1OHinRE010745
	for <meta-arago@arago-project.org>; Mon, 24 Feb 2014 11:44:49 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s1OHinHt002925
	for <meta-arago@arago-project.org>; Mon, 24 Feb 2014 11:44:49 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.174.1;
	Mon, 24 Feb 2014 11:44:49 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id s1OHinRm006245;
	Mon, 24 Feb 2014 11:44:49 -0600
Date: Mon, 24 Feb 2014 12:44:48 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: "Maupin, Chase" <chase.maupin@ti.com>
Message-ID: <20140224174448.GE18510@edge>
References: <1393123599-4661-1-git-send-email-sam.nelson@ti.com>
	<7D46E86EC0A8354091174257B2FED1015CEE95EB@DLEE11.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <7D46E86EC0A8354091174257B2FED1015CEE95EB@DLEE11.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH v2] lksctp-tools: Add recipe for lksctp
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
X-List-Received-Date: Mon, 24 Feb 2014 17:44:50 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, Feb 24, 2014 at 04:00:25PM +0000, Maupin, Chase wrote:
> >-----Original Message-----
> >From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> >bounces@arago-project.org] On Behalf Of Nelson, Sam
> >Sent: Saturday, February 22, 2014 8:47 PM
> >To: meta-arago@arago-project.org
> >Subject: [meta-arago] [PATCH v2] lksctp-tools: Add recipe for
> >lksctp
> >
> >- The linux kernel Stream control transmission protocol
> >- Original recipe by Jingting Zhou
> 
> Can you please give a more descriptive statement about where this recipe 
> came from?  What layer for example, a URL to the original recipe.

Actually, since this is coming from a forked meta-arago-mcsdk and maybe even 
from a private tree, I'd rather not advertise the information such as URL. If 
you want to mention it, just say it comes from previous version of MCSDK...


> Also, can you split this into two patches?  One that adds the original 
> recipe and one that splits out your changes so it is easier to tell what has 
> been modified on top.

??? I think you are missing the fact that it's an in-house recipe, not coming 
from Open Source...


> >Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> >
> >---
> >Updated RREPLACES_${PN}
> >Fix build issue with .so
> >---
> >---
> > .../recipes-bsp/lksctp-tools/lksctp-tools_1.0.7.bb |   51
> >++++++++++++++++++++
> > 1 file changed, 51 insertions(+)
> > create mode 100755 meta-arago-extras/recipes-bsp/lksctp-
> >tools/lksctp-tools_1.0.7.bb
> >
> >diff --git a/meta-arago-extras/recipes-bsp/lksctp-tools/lksctp-
> >tools_1.0.7.bb b/meta-arago-extras/recipes-bsp/lksctp-
> >tools/lksctp-tools_1.0.7.bb
> >new file mode 100755
> >index 0000000..5c75552
> >--- /dev/null
> >+++ b/meta-arago-extras/recipes-bsp/lksctp-tools/lksctp-
> >tools_1.0.7.bb
> >@@ -0,0 +1,51 @@
> >+DESCRIPTION = "The Linux Kernel Stream Control Transmission
> >Protocol (lksctp) project"
> >+SECTION = "libs"
> >+PRIORITY = "optional"
> >+LICENSE = "LGPLv2"
> >+LIC_FILES_CHKSUM =
> >"file://src/include/netinet/sctp.h;md5=8089fbe48b63b73c8d091bee750
> >b2ebc"
> >+
> >+INC_PR = "r0"
> >+PR = "${INC_PR}.0"
> >+
> >+SRC_URI = "${SOURCEFORGE_MIRROR}/lksctp/lksctp-tools-
> >${PV}.tar.gz"
> >+
> >+SRC_URI[md5sum] = "047562b40537eb3be5d5ec3ae0a2198b"
> >+SRC_URI[sha256sum] =
> >"e920e89d110cff9847f1d86a1d7a23a156a8abcc9e65a35655d687fd08377595"
> >+
> >+S = "${WORKDIR}/${BPN}-${PV}"
> >+
> >+BBCLASSEXTEND = "native"
> >+
> >+inherit autotools pkgconfig binconfig
> >+
> >+do_install_append_virtclass-native() {
> >+	:
> >+}
> >+
> >+RREPLACES_${PN} = "lksctp"
> >+
> >+LEAD_SONAME = "libsctp.so"
> >+
> >+PACKAGES =+ "${PN}-withsctp ${PN}-utils"
> >+
> >+FILES_${PN} = "${libexecdir}/* ${libdir}/lib*${SOLIBS} \
> >+            ${sysconfdir} ${sharedstatedir} ${localstatedir} \
> >+            ${base_libdir}/*${SOLIBS}"
> >+
> >+FILES_${PN}-dev += " \
> >+  ${datadir}/lksctp-tools/checksctp.c \
> >+  ${datadir}/lksctp-tools/sctp_socket.c \
> >+  ${datadir}/lksctp-tools/sctp_bind.c \
> >+  ${datadir}/lksctp-tools/sctp_darn.c \
> >+  ${datadir}/lksctp-tools/sctp_load_libs.c \
> >+  ${datadir}/lksctp-tools/sctp_sockopt.c \
> >+  ${datadir}/lksctp-tools/sctp_socket.h \
> >+  ${datadir}/lksctp-tools/sctp_test.c \
> >+  ${datadir}/lksctp-tools/sctp_darn.h \
> >+  ${libdir}/lksctp-tools/lib*.so"
> >+
> >+FILES_${PN}-utils = " \
> >+  ${bindir}/sctp_test \
> >+  ${bindir}/sctp_darn \
> >+  ${bindir}/checksctp \
> >+  ${bindir}/withsctp"
> >--
> >1.7.9.5
> >
> >_______________________________________________
> >meta-arago mailing list
> >meta-arago@arago-project.org
> >http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago


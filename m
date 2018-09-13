Return-Path: <denys@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 8D73152A9E
	for <meta-arago@arago-project.org>;
	Thu, 13 Sep 2018 19:38:29 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id w8DJcLBT022983
	for <meta-arago@arago-project.org>; Thu, 13 Sep 2018 14:38:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1536867501;
	bh=Epilhtqn06RO/NUi7Wy5UaCRiuS6eYww2qOY+h8MK/4=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=o1g++3Kqc+r5j9udbonN3gut74PHLFYrWHVgQh6jPuW2bOWS11a0sN8G/y5ZtaSrx
	8+I9y8Qg+lsFCflNDs3jd/1qYFd8Zl6vzadon7YCn6KdM/iCcEcx98HqyDjWYXJwMC
	j2G09BJj17MGrSeOs7PKq63VWHfSaMWICed93VNQ=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8DJcLVQ017676
	for <meta-arago@arago-project.org>; Thu, 13 Sep 2018 14:38:21 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE108.ent.ti.com
	(10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Thu, 13 Sep 2018 14:38:21 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE106.ent.ti.com
	(10.64.6.27) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Thu, 13 Sep 2018 14:38:21 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8DJcK7r011498;
	Thu, 13 Sep 2018 14:38:21 -0500
Date: Thu, 13 Sep 2018 15:36:55 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <20180913193655.GO12296@beryl>
References: <1536866245-50936-1-git-send-email-denys@ti.com>
	<97b63779-9082-152c-2871-02f5c88ee26f@ti.com>
MIME-Version: 1.0
In-Reply-To: <97b63779-9082-152c-2871-02f5c88ee26f@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [EXTERNAL] [rocko/master][PATCH] u-boot-k3-r5: update SYSFW to 2018.08b
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
X-List-Received-Date: Thu, 13 Sep 2018 19:38:29 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Thu, Sep 13, 2018 at 03:30:27PM -0400, Jacob Stiffler wrote:
> 
> 
> On 9/13/2018 3:17 PM, Denys Dmytriyenko wrote:
> >Also install and deploy versioned SYSFW binary with short symlink.
> >
> >Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> >---
> >  .../recipes-bsp/u-boot/u-boot-k3-r5_2018.01.bb          | 17 +++++++++++------
> >  1 file changed, 11 insertions(+), 6 deletions(-)
> >
> >diff --git a/meta-arago-distro/recipes-bsp/u-boot/u-boot-k3-r5_2018.01.bb b/meta-arago-distro/recipes-bsp/u-boot/u-boot-k3-r5_2018.01.bb
> >index 0ff5658..57055c7 100644
> >--- a/meta-arago-distro/recipes-bsp/u-boot/u-boot-k3-r5_2018.01.bb
> >+++ b/meta-arago-distro/recipes-bsp/u-boot/u-boot-k3-r5_2018.01.bb
> >@@ -7,10 +7,12 @@ PKG_${PN}-dbg = "${PN}-dbg"
> >  COMPATIBLE_MACHINE = "k3"
> >-SYSFW_VER = "2018.07a"
> >-SYSFW_BIN_am65xx-evm = "ti-sci-firmware-am6x-gp.bin"
> >+SYSFW_VER = "2018.08b"
> >+SYSFW_TISCI_am65xx-evm = "ti-sci-firmware-am65x-gp.bin"
> >+SYSFW_BINARY = "sysfw.bin"
> >+SYSFW_IMAGE = "sysfw-${SYSFW_VER}.bin"
> >-SRCREV_sysfw = "2035022224dcc885ac2cd0b11f8c76190f5af962"
> >+SRCREV_sysfw = "463b1b4a50e8e361fa333f87caf74d2e05bc0a82"
> >  SYSFW_BRANCH = "ti-linux-firmware-4.1.y"
> >  SRCREV_FORMAT = "sysfw"
> >@@ -33,13 +35,16 @@ UBOOT_SYMLINK = "tiboot3-${MACHINE}.bin"
> >  SPL_BINARY_k3 = ""
> >  do_configure_append() {
> >-	${WORKDIR}/gen_x509_cert.sh -m rom -c m3 -b ${WORKDIR}/fw/ti-sysfw/${SYSFW_BIN} -o ${WORKDIR}/sysfw.bin -l 0x40000
> >+	${WORKDIR}/gen_x509_cert.sh -m rom -c m3 -b ${WORKDIR}/fw/ti-sysfw/${SYSFW_TISCI} -o ${WORKDIR}/sysfw.bin -l 0x40000
> 
> Should "${SYSFW_BINARY}" be used here instead of "sysfw.bin" to match
> do_install()?

Sure, would make sense.


> >  do_install_append() {
> >-	install -m 644 ${WORKDIR}/sysfw.bin ${D}/boot/
> >+	install -m 644 ${WORKDIR}/${SYSFW_BINARY} ${D}/boot/${SYSFW_IMAGE}
> >+	ln -sf ${SYSFW_IMAGE} ${D}/boot/${SYSFW_BINARY}
> >  }
> >  do_deploy_append() {
> >-	install -m 644 ${WORKDIR}/sysfw.bin ${DEPLOYDIR}/
> >+	install -m 644 ${WORKDIR}/${SYSFW_BINARY} ${DEPLOYDIR}/${SYSFW_IMAGE}
> >+	rm -f ${DEPLOYDIR}/${SYSFW_BINARY}
> >+	ln -sf ${SYSFW_IMAGE} ${DEPLOYDIR}/${SYSFW_BINARY}
> >  }
> 


Return-Path: <denys@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id F38AB52976
	for <meta-arago@arago-project.org>;
	Tue, 16 Jul 2019 19:58:49 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x6GJw06c027206
	for <meta-arago@arago-project.org>; Tue, 16 Jul 2019 14:58:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1563307080;
	bh=O2rjVSJjiyKyrHTr91S8yq3jFQXYk+TGdSTyMwPOtVw=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=HVImLChxHsLy4TdjjGurA5W0bXAhrKkjeLn14e7LhTP0TBDrQz22FUtoZx+tvuBf/
	dS4VtqF84o/iSBAygM00EEHc/DgpKGvMZrgr9StVj2qEOmcs3Hf6FKSt25qp3y089u
	tF3jSIwXF6VmPE8OcPomHCv+W+dvrus0QPh3/rjY=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x6GJw074093419
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 16 Jul 2019 14:58:00 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Tue, 16 Jul 2019 14:58:00 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE101.ent.ti.com
	(157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Tue, 16 Jul 2019 14:58:00 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x6GJw0KV097000;
	Tue, 16 Jul 2019 14:58:00 -0500
Date: Tue, 16 Jul 2019 15:57:59 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <20190716195759.GK9038@beryl>
References: <1563217177-9111-1-git-send-email-j-stiffler@ti.com>
	<20190715194420.GF9038@beryl>
	<431d6799-f6f0-e976-c4fb-570a8a985a4b@ti.com>
	<20190715200517.GI9038@beryl>
	<8f962f08-e98b-526c-af74-98c243873592@ti.com>
MIME-Version: 1.0
In-Reply-To: <8f962f08-e98b-526c-af74-98c243873592@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [master/thud][PATCH 1/2] kaldi: add the kaldi speech recognition toolkit
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
X-List-Received-Date: Tue, 16 Jul 2019 19:58:50 -0000
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Tue, Jul 16, 2019 at 09:16:31AM -0400, Jacob Stiffler wrote:
> 
> On 7/15/2019 4:05 PM, Denys Dmytriyenko wrote:
> >On Mon, Jul 15, 2019 at 03:53:13PM -0400, Jacob Stiffler wrote:
> >>On 7/15/2019 3:44 PM, Denys Dmytriyenko wrote:
> >>>On Mon, Jul 15, 2019 at 02:59:36PM -0400, Jacob Stiffler wrote:
> >>>>From: Yimin Zhang <a0216607@ti.com>
> >>>>
> >>>>Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> >>>>---
> >>>>  .../recipes-support/kaldi/kaldi_git.bb             | 47 ++++++++++++++++++++++
> >>>>  1 file changed, 47 insertions(+)
> >>>>  create mode 100644 meta-arago-extras/recipes-support/kaldi/kaldi_git.bb
> >>>>
> >>>>diff --git a/meta-arago-extras/recipes-support/kaldi/kaldi_git.bb b/meta-arago-extras/recipes-support/kaldi/kaldi_git.bb
> >>>>new file mode 100644
> >>>>index 0000000..6937696
> >>>>--- /dev/null
> >>>>+++ b/meta-arago-extras/recipes-support/kaldi/kaldi_git.bb
> >>>>@@ -0,0 +1,47 @@
> >>>>+SUMMARY = "TI KALDI speech recognition toolkit"
> >>>>+HOMEPAGE = "http://kaldi-asr.org"
> >>>>+LICENSE = "Apache-2.0"
> >>>>+LIC_FILES_CHKSUM = "file://COPYING;md5=35439d742a3df991e4f4f0e68e2d634c"
> >>>>+
> >>>>+PR = "r0"
> >>>>+COMPATIBLE_MACHINE = "dra7xx"
> >>>>+
> >>>>+require recipes-ti/includes/arago-paths.inc
> >>>>+
> >>>>+SRC_URI = "git://git.ti.com/processor-sdk/kaldi.git;protocol=git;branch=${BRANCH}"
> >>>>+BRANCH = "kaldi_1-0-0"
> >>>>+SRCREV = "a472be2e2f8598a3e360bc7ca87ff4f73afa2d9e"
> >>>>+
> >>>>+DEPENDS = " \
> >>>>+	linalg \
> >>>>+	openfst \
> >>>>+"
> >>>>+
> >>>>+S = "${WORKDIR}/git"
> >>>>+
> >>>>+export LINALG_DIR  = "${LINALG_INSTALL_DIR}"
> >>>>+export OPENFST_DIR = "${STAGING_DIR_TARGET}${prefix}"
> >>>>+export TARGET_ROOTDIR="${STAGING_DIR_TARGET}"
> >>>>+
> >>>>+PACKAGE_ARCH = "${MACHINE_ARCH}"
> >>>>+EXTRA_OECONF += "--static --use-cuda=no --mathlib=CLAPACK --clapack-root=${LINALG_INSTALL_DIR}/packages/ti/linalg --fst-root=${STAGING_DIR_TARGET}${prefix} --fst-version=1.6.2 --ti-cross-compile --ti-device=AM57"
> >>>>+
> >>>>+EXTRA_OEMAKE = "-C src"
> >>>>+
> >>>>+do_configure() {
> >>>>+	cd src
> >>>>+	chmod +x configure
> >>>>+	./configure ${EXTRA_OECONF}
> >>>Any specific reason to not inherit autotools and/or calling oe_runconf?
> >>
> >>I was seeing some problem where is was trying to invoke "../configure"
> >>instead of "./configure".  I never completely understood what was causing
> >>this, so I can look into it more if you'd like.
> >Probably because configure is not in ${S}.
> 
> 
> I made progress to get configure invoked using oe_runconf, but it appears
> that this configure is a bit non-standard. The options provided by
> CONFIGUREOPTS (e.g. --build, --host, --target) are not recognized, and cause
> an error. The options "--ti-cross-compile --ti-device=AM57" appear to have
> been implemented to enable cross-compilation.
> 
> So is it better to unset CONFIGUREOPTS and use oe_runconf, or directly
> invoke configure?

I see. Since it's a custom-made configure script with pretty much non-standard 
options, it's probably better to not use autoconf.bbclass, CONFIGUREOPTS and 
maybe even EXTRA_OECONF to avoid confusion. Thoughts?


> >>>>+}
> >>>>+
> >>>>+do_compile() {
> >>>>+	oe_runmake online2bin featbin
> >>>>+}
> >>>>+
> >>>>+do_install() {
> >>>>+	chmod +x export_kaldi.sh
> >>>>+	./export_kaldi.sh --nnet2-online . ${D}${datadir}/ti/examples/kaldi
> >>>>+}
> >>>>+
> >>>>+# to create a package for KALDI
> >>>>+FILES_${PN} += "${datadir}/ti/examples/kaldi"
> >>>>-- 
> >>>>2.7.4
> >>>>
> >>>>_______________________________________________
> >>>>meta-arago mailing list
> >>>>meta-arago@arago-project.org
> >>>>http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago


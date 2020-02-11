Return-Path: <denys@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 76D435298B
	for <meta-arago@arago-project.org>;
	Tue, 11 Feb 2020 15:27:49 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01BFPrD5029961
	for <meta-arago@arago-project.org>; Tue, 11 Feb 2020 09:25:53 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1581434753;
	bh=bCBmCbTb1Njtlbe6ySrVlRS1mHTCQeR1rDSxAbnL9AU=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=SNtZ0c3/0pFrErjIqmSuz/EZxScv1odXBjgVdWhDVTCwFSF8nF+loCUDmTSnSV0yO
	CvHt2gkzsQVwLNV8vt23wGvim8jFzEx93wbdPq1/H8xh9qMoAjKGn7ZA9dHfAF1aH/
	dbj5eJFcCY3gGafhkPF0GUfxy/36YD9bk9iJhk8E=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 01BFPrRM116335
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 11 Feb 2020 09:25:53 -0600
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Tue, 11 Feb 2020 09:25:53 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE101.ent.ti.com
	(157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Tue, 11 Feb 2020 09:25:53 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01BFPqmX028647;
	Tue, 11 Feb 2020 09:25:52 -0600
Date: Tue, 11 Feb 2020 10:25:52 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <20200211152552.GB20281@beryl>
References: <20200127162616.24864-1-afd@ti.com> <20200127194555.GW3658@beryl>
	<20200211014113.GF17543@beryl>
	<f75feb41-e535-292a-22e2-f12fdb71aaba@ti.com>
MIME-Version: 1.0
In-Reply-To: <f75feb41-e535-292a-22e2-f12fdb71aaba@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [EXTERNAL] Re: [master/thud][PATCH] screenshot: Remove this screenshot tool in favor of fbgrab
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
X-List-Received-Date: Tue, 11 Feb 2020 15:27:49 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Feb 11, 2020 at 08:53:16AM -0500, Jacob Stiffler wrote:
> 
> On 2/10/2020 8:41 PM, Denys Dmytriyenko wrote:
> >On Mon, Jan 27, 2020 at 02:45:55PM -0500, Denys Dmytriyenko wrote:
> >>On Mon, Jan 27, 2020 at 11:26:16AM -0500, Andrew F. Davis wrote:
> >>>This takes a screenshot of the current framebuffer only. There are tools
> >>>for taking screenshots of the current window system which is usually what
> >>>a user wants. If the user really wants the conent of the framebuffer then
> >>>they can use fbgrab which is already in meta-oe.
> >>I'm not 100% sure, but I believe there's some use of screeshot tool in Matrix
> >>demos. I guess we would need to update that too for this change.
> >>
> >>Jake, any comments from OOBE perspective?
> >Ping
> >
> 
> I am not able to find any reference to this screenshot tool.

Ok, I guess we can just drop it then.


> - Jake
> 
> 
> >>Denys
> >>
> >>
> >>>Signed-off-by: Andrew F. Davis <afd@ti.com>
> >>>---
> >>>  .../packagegroup-arago-tisdk-amsdk.bb         |  5 ----
> >>>  .../screenshot/screenshot_1.0.bb              | 27 -------------------
> >>>  2 files changed, 32 deletions(-)
> >>>  delete mode 100644 meta-arago-extras/recipes-graphics/screenshot/screenshot_1.0.bb
> >>>
> >>>diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-amsdk.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-amsdk.bb
> >>>index 42c6aefa..c9a17c5e 100644
> >>>--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-amsdk.bb
> >>>+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-amsdk.bb
> >>>@@ -17,11 +17,6 @@ OOBE_ti43x += "\
> >>>      parse-ip \
> >>>  "
> >>>-EXTRA_APPLICATIONS = "\
> >>>-    screenshot \
> >>>-"
> >>>-
> >>>  RDEPENDS_${PN} = "\
> >>>      ${OOBE} \
> >>>-    ${EXTRA_APPLICATIONS} \
> >>>  "
> >>>diff --git a/meta-arago-extras/recipes-graphics/screenshot/screenshot_1.0.bb b/meta-arago-extras/recipes-graphics/screenshot/screenshot_1.0.bb
> >>>deleted file mode 100644
> >>>index 08a3040b..00000000
> >>>--- a/meta-arago-extras/recipes-graphics/screenshot/screenshot_1.0.bb
> >>>+++ /dev/null
> >>>@@ -1,27 +0,0 @@
> >>>-SUMMARY = "Screenshot"
> >>>-HOMEPAGE = "https://gitorious.org/screenshot"
> >>>-LICENSE = "BSD"
> >>>-LIC_FILES_CHKSUM = "file://COPYING;md5=5cad16cc3f514a15adb1d710b82d5fc4"
> >>>-SECTION = "graphics"
> >>>-
> >>>-PR = "r2"
> >>>-
> >>>-BRANCH ?= "master"
> >>>-SRCREV = "169242aa7a265d5c94755d74601ad4a3f1828c96"
> >>>-
> >>>-SRC_URI = "git://git.ti.com/apps/screenshot.git;protocol=git;branch=${BRANCH}"
> >>>-
> >>>-S = "${WORKDIR}/git"
> >>>-
> >>>-do_compile() {
> >>>-    export CROSS_COMPILE=${TARGET_PREFIX}
> >>>-    export CFLAGS='${TARGET_CC_ARCH}'
> >>>-    # build the release version
> >>>-    make release CC="${CC}"
> >>>-}
> >>>-
> >>>-do_install() {
> >>>-    make DESTDIR=${D} install
> >>>-}
> >>>-
> >>>-INSANE_SKIP_${PN} = "ldflags"
> >>>-- 
> >>>2.17.1
> >>>
> >>_______________________________________________
> >>meta-arago mailing list
> >>meta-arago@arago-project.org
> >>http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> >_______________________________________________
> >meta-arago mailing list
> >meta-arago@arago-project.org
> >http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago


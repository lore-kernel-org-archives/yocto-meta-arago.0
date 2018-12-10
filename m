Return-Path: <denys@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id DB43C5298A
	for <meta-arago@arago-project.org>;
	Mon, 10 Dec 2018 18:33:28 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id wBAIXH8F038184
	for <meta-arago@arago-project.org>; Mon, 10 Dec 2018 12:33:17 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1544466797;
	bh=X7iReO2Pyw4AUiSWc3z8V6nkA5M98MfDOHFpdDiMwlI=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=IPrdU9TZVWMSq1Dl1EsdV/48UiC5AT8phKdXkRWYoW9cWzPWu8bjQwZc/XP8rP93X
	KMzZMRptaZLkwYF/DVFYWpBqDfMutXfRmvVCGGSCwK70VDJ04moTJJeS4WPoPTwHnu
	Xg+QQ5EPFlAX4E3/0C0KKjj35fj0VmGSsby+xO3I=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id wBAIXHsM102784
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Mon, 10 Dec 2018 12:33:17 -0600
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Mon, 10 Dec 2018 12:33:17 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Mon, 10 Dec 2018 12:33:17 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id wBAIXGqM013894;
	Mon, 10 Dec 2018 12:33:17 -0600
Date: Mon, 10 Dec 2018 13:33:16 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <20181210183316.GB19286@beryl>
References: <1544457104-42812-1-git-send-email-e-ruei1@ti.com>
	<8c271475-2091-0cea-b1c5-742fe894950a@ti.com>
MIME-Version: 1.0
In-Reply-To: <8c271475-2091-0cea-b1c5-742fe894950a@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [EXTERNAL] [PATCH] amsdk-av-files: move the AMSDK AV files from gforge.ti.com to git.ti.com
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
X-List-Received-Date: Mon, 10 Dec 2018 18:33:29 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, Dec 10, 2018 at 01:28:03PM -0500, Jacob Stiffler wrote:
> ACK
> 
> 
> For the license checksum change, entries for the new clips were added to the
> manifest.

Thanks. It would be nice to mention this in the commit log.


> On 12/10/2018 10:51 AM, Eric Ruei wrote:
> >- move the AMSDK AV files location
> >- add k3 specific video images
> >
> >Signed-off-by: Eric Ruei <e-ruei1@ti.com>
> >---
> >  .../amsdk-av-files/amsdk-av-files_1.4.bb                 | 16 +++++++++-------
> >  1 file changed, 9 insertions(+), 7 deletions(-)
> >
> >diff --git a/meta-arago-extras/recipes-multimedia/amsdk-av-files/amsdk-av-files_1.4.bb b/meta-arago-extras/recipes-multimedia/amsdk-av-files/amsdk-av-files_1.4.bb
> >index 9d20b1a..2f570d4 100644
> >--- a/meta-arago-extras/recipes-multimedia/amsdk-av-files/amsdk-av-files_1.4.bb
> >+++ b/meta-arago-extras/recipes-multimedia/amsdk-av-files/amsdk-av-files_1.4.bb
> >@@ -1,9 +1,9 @@
> >  DESCRIPTION = "AMSDK multimedia support files"
> >-HOMEPAGE = "https://gforge.ti.com/gf/project/am_multimedia/"
> >+HOMEPAGE = "https://git.ti.com/processor-sdk/amsdk-av-files/"
> >  LICENSE = "CC-BY-NC-ND-3.0 & CC-BY-3.0"
> >  SECTION = "multimedia"
> >-LIC_FILES_CHKSUM = "file://Multimedia_Data_Files_Manifest.doc;md5=da0727f80b90422138535dfffc36cd1a"
> >-PR = "r1"
> >+LIC_FILES_CHKSUM = "file://Multimedia_Data_Files_Manifest.doc;md5=fe154d291c69c51495a5bb4a456403b5"
> >+PR = "r2"
> >  PACKAGE_ARCH = "${MACHINE_ARCH}"
> >@@ -19,12 +19,16 @@ VIDEO_FILES_append_dra7xx      = "video_wvga \
> >                                    video_1080p \
> >                                    video_720p \
> >                                    video_yuv"
> >+VIDEO_FILES_append_k3          = "video_720p"
> >  VIDEO_FILES_keystone = "video_720p "
> >-SRC_URI = "https://gforge.ti.com/gf/download/frsrelease/1279/7769/amsdk-av-files_${PV}.tar.gz;name=avfilestarball"
> >+BRANCH = "master"
> >-S = "${WORKDIR}/amsdk-av-files"
> >+SRC_URI = "git://git.ti.com/processor-sdk/amsdk-av-files.git;protocol=git;branch=${BRANCH}"
> >+SRCREV = "1b73009090265328ebaf1b6c880dfeccae5a8f19"
> >+
> >+S = "${WORKDIR}/git"
> >  do_compile() {
> >      :
> >@@ -42,5 +46,3 @@ do_install() {
> >  FILES_${PN} += "${datadir}/ti/*"
> >-SRC_URI[avfilestarball.md5sum] = "29a2f8b5f41f49e30bbe9cf53eb06c5a"
> >-SRC_URI[avfilestarball.sha256sum] = "64dde10d03156d480c6f38494c9503e73878fa0a8d5009182ed43b0e926b5569"
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago


Return-Path: <denys@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id 1301D52A66
	for <meta-arago@arago-project.org>;
	Mon, 24 Apr 2017 20:32:19 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v3OKWIPv027332
	for <meta-arago@arago-project.org>; Mon, 24 Apr 2017 15:32:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1493065938;
	bh=13ZVz9LTLQ5tSL4XCrtxRBg0qF1BxhJCUG6AATwaF8Q=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=RwSYoadUEJgoMej45QBQMQHGwp87tEHrf90MmV+JpoRnXki+Tr/iyJiO4KaVFj6Nk
	IxccqYAeeKHrBUH9/LaXAxXq+ocS6WBJIzMoWG3RZdm50N1AGm5cGatOfaiGUbZxA5
	64E7Y3ds+FNzMgietHKeXP6tntmf/lx/ovQG9nt8=
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v3OKWIFv030013
	for <meta-arago@arago-project.org>; Mon, 24 Apr 2017 15:32:18 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 24 Apr 2017 15:32:18 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v3OKWIOa000514;
	Mon, 24 Apr 2017 15:32:18 -0500
Date: Mon, 24 Apr 2017 16:32:17 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Dan Murphy <dmurphy@ti.com>
Message-ID: <20170424203217.GE30097@edge>
References: <20170424193843.1759-1-dmurphy@ti.com>
	<20170424202527.GC30097@edge>
	<3d750405-374e-d924-1583-1ee8d538520d@ti.com>
MIME-Version: 1.0
In-Reply-To: <3d750405-374e-d924-1583-1ee8d538520d@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH] optee: Update SRCREV for client, os and test
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
X-List-Received-Date: Mon, 24 Apr 2017 20:32:19 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, Apr 24, 2017 at 03:30:32PM -0500, Dan Murphy wrote:
> Denys
> 
> On 04/24/2017 03:25 PM, Denys Dmytriyenko wrote:
> > Dan,
> > 
> > On Mon, Apr 24, 2017 at 02:38:43PM -0500, Dan Murphy wrote:
> >> Updating the SRCREV for the optee-client,
> >> optee-os and optee-test to align with Linaro's
> >> code base and kernel driver.  For the 2017.01-rc1
> >>
> >> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> >> ---
> >>  meta-arago-distro/recipes-security/optee/optee-client.bbappend   | 2 +-
> >>  meta-arago-distro/recipes-security/optee/optee-os_git.bbappend   | 2 +-
> >>  meta-arago-distro/recipes-security/optee/optee-test_git.bbappend | 2 +-
> >>  3 files changed, 3 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/meta-arago-distro/recipes-security/optee/optee-client.bbappend b/meta-arago-distro/recipes-security/optee/optee-client.bbappend
> >> index 3a24c60..df7587d 100644
> >> --- a/meta-arago-distro/recipes-security/optee/optee-client.bbappend
> >> +++ b/meta-arago-distro/recipes-security/optee/optee-client.bbappend
> >> @@ -4,4 +4,4 @@ SRC_URI = "git://git.ti.com/optee/ti-optee-client.git;branch=${BRANCH} \
> >>             file://tee-supplicant.service"
> >>  
> >>  BRANCH = "ti_optee_client"
> >> -SRCREV = "5477e9ebf093ba3ac5296409a690944db6c0014c"
> >> +SRCREV = "1df4046bd729e866743454a18a71e72228e585fd"
> >> diff --git a/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend b/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
> >> index c50c47d..4fa39de 100644
> >> --- a/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
> >> +++ b/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
> >> @@ -8,7 +8,7 @@ SRC_URI = "git://git.ti.com/optee/ti-optee-os.git;branch=${BRANCH} \
> >>             file://0001-allow-setting-sysroot-for-libgcc-lookup.patch \
> >>  "
> >>  BRANCH = "ti_optee_os"
> >> -SRCREV = "f4543643876f50b5c454955763c243b8625b0294"
> >> +SRCREV = "a92d4a6698b0acc8147fba21b10c7e4473da3b9e"
> > 
> > This SRCREV is incorrect.
> 
> Yes you are correct I was looking at the -next branch when I added the rev
> 
> V2 on its way

Since V1 got merged, please send a fix.


> >>  EXTRA_OEMAKE = "CROSS_COMPILE_core=${HOST_PREFIX}  \
> >>                  CROSS_COMPILE_ta_arm32=${HOST_PREFIX}  \
> >> diff --git a/meta-arago-distro/recipes-security/optee/optee-test_git.bbappend b/meta-arago-distro/recipes-security/optee/optee-test_git.bbappend
> >> index a94cd42..3ab6177 100644
> >> --- a/meta-arago-distro/recipes-security/optee/optee-test_git.bbappend
> >> +++ b/meta-arago-distro/recipes-security/optee/optee-test_git.bbappend
> >> @@ -3,4 +3,4 @@ PR_append = ".arago1"
> >>  SRC_URI = "git://git.ti.com/optee/ti-optee-test.git;branch=${BRANCH}"
> >>  
> >>  BRANCH = "ti_optee_test"
> >> -SRCREV = "ba271a6e3eb2bbb6996b5de73918216f64a9e077"
> >> +SRCREV = "170a1ee60a98b407790d97dc682568981d344ca3"
> >> -- 
> >> 1.9.1
> >>
> 
> 
> -- 
> ------------------
> Dan Murphy


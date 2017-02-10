Return-Path: <denys@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id 65078529D2
	for <meta-arago@arago-project.org>;
	Fri, 10 Feb 2017 17:22:05 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v1AHLsFd010847
	for <meta-arago@arago-project.org>; Fri, 10 Feb 2017 11:21:54 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v1AHLnOE007927
	for <meta-arago@arago-project.org>; Fri, 10 Feb 2017 11:21:49 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 10 Feb 2017 11:21:48 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v1AHLmWW005307;
	Fri, 10 Feb 2017 11:21:48 -0600
Date: Fri, 10 Feb 2017 12:21:48 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Dan Murphy <dmurphy@ti.com>
Message-ID: <20170210172147.GJ2612@edge>
References: <1486746451-23634-1-git-send-email-dmurphy@ti.com>
MIME-Version: 1.0
In-Reply-To: <1486746451-23634-1-git-send-email-dmurphy@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org, afd@ti.com
Subject: Re: [PATCH 1/2] optee: Update SRCREV for client, os and test
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
X-List-Received-Date: Fri, 10 Feb 2017 17:22:07 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Thanks, merged.


On Fri, Feb 10, 2017 at 11:07:30AM -0600, Dan Murphy wrote:
> Updating the SRCREV for the optee-client,
> optee-os and optee-test to align with Linaro's
> code base and kernel driver.
> 
> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> ---
>  meta-arago-distro/recipes-security/optee/optee-client.bbappend   | 2 +-
>  meta-arago-distro/recipes-security/optee/optee-os_git.bbappend   | 2 +-
>  meta-arago-distro/recipes-security/optee/optee-test_git.bbappend | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/meta-arago-distro/recipes-security/optee/optee-client.bbappend b/meta-arago-distro/recipes-security/optee/optee-client.bbappend
> index cdbfaab..3a24c60 100644
> --- a/meta-arago-distro/recipes-security/optee/optee-client.bbappend
> +++ b/meta-arago-distro/recipes-security/optee/optee-client.bbappend
> @@ -4,4 +4,4 @@ SRC_URI = "git://git.ti.com/optee/ti-optee-client.git;branch=${BRANCH} \
>             file://tee-supplicant.service"
>  
>  BRANCH = "ti_optee_client"
> -SRCREV = "ce5fefe6cba5df9b4f31399b1155ba768eee0b78"
> +SRCREV = "5477e9ebf093ba3ac5296409a690944db6c0014c"
> diff --git a/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend b/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
> index 7ae2a4a..c50c47d 100644
> --- a/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
> +++ b/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
> @@ -8,7 +8,7 @@ SRC_URI = "git://git.ti.com/optee/ti-optee-os.git;branch=${BRANCH} \
>             file://0001-allow-setting-sysroot-for-libgcc-lookup.patch \
>  "
>  BRANCH = "ti_optee_os"
> -SRCREV = "4556015010dbf648d236a72857e927317b0f6438"
> +SRCREV = "f4543643876f50b5c454955763c243b8625b0294"
>  
>  EXTRA_OEMAKE = "CROSS_COMPILE_core=${HOST_PREFIX}  \
>                  CROSS_COMPILE_ta_arm32=${HOST_PREFIX}  \
> diff --git a/meta-arago-distro/recipes-security/optee/optee-test_git.bbappend b/meta-arago-distro/recipes-security/optee/optee-test_git.bbappend
> index 2fa4182..ad70773 100644
> --- a/meta-arago-distro/recipes-security/optee/optee-test_git.bbappend
> +++ b/meta-arago-distro/recipes-security/optee/optee-test_git.bbappend
> @@ -4,4 +4,4 @@ SRC_URI = "git://git.ti.com/optee/ti-optee-test.git;branch=${BRANCH}"
>  SRC_URI += "file://fix-build-failure-with-GCC6.patch"
>  
>  BRANCH = "ti_optee_test"
> -SRCREV = "6203b8769beff4eccf7104a6474991114691bf90"
> +SRCREV = "ba271a6e3eb2bbb6996b5de73918216f64a9e077"
> -- 
> 2.11.0.rc0.7.gbe5a750
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago


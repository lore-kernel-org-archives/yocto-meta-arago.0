Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id B520B52A9A
	for <meta-arago@arago-project.org>;
	Thu,  4 Sep 2014 17:38:44 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s84Hchhw020208
	for <meta-arago@arago-project.org>; Thu, 4 Sep 2014 12:38:44 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s84HchEC002453
	for <meta-arago@arago-project.org>; Thu, 4 Sep 2014 12:38:43 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 4 Sep 2014 12:38:43 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id s84HchKm029504;
	Thu, 4 Sep 2014 12:38:43 -0500
Date: Thu, 4 Sep 2014 13:38:42 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <20140904173842.GL18620@edge>
References: <1409851868-7389-1-git-send-email-j-stiffler@ti.com>
	<1409851868-7389-3-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
In-Reply-To: <1409851868-7389-3-git-send-email-j-stiffler@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [tisdk-build-scripts][PATCH 3/4] bitbake-test-sdk-image: Add support to control verbosity of build logging.
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
X-List-Received-Date: Thu, 04 Sep 2014 17:38:45 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Can you please elaborate on this change? You don't seem to be increasing 
Bitbake's verbosity level, just enabling capturing stdout and stderr into a 
file, which gets captured by results.html anyway. What's the purpose?


On Thu, Sep 04, 2014 at 01:31:07PM -0400, Jacob Stiffler wrote:
> * Setting BUILD_LOG_VERBOSE="true" (case sensitive) will enable logging stdout
>   and stderr for the bitbake command to the build log.
> 
> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> ---
>  lib/oesdk/bitbake-test-sdk-image |    8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/lib/oesdk/bitbake-test-sdk-image b/lib/oesdk/bitbake-test-sdk-image
> index cff86e4..7d8d093 100644
> --- a/lib/oesdk/bitbake-test-sdk-image
> +++ b/lib/oesdk/bitbake-test-sdk-image
> @@ -375,12 +375,16 @@ bitbake_sdk_images(){
>          for c in "${bitbake_command_list[@]}"
>          do
>              log $machine_build_log echo "executing bitbake command $c for machine $m"
> -            MACHINE=$m EXTRA_TISDK_FILES="${INSTALLER_EXTRAS_ROOT}/${MACHINE}" TISDK_VERSION="${TISDK_VERSION}" bitbake $c
> +            if [ "${BUILD_LOG_VERBOSE}" = "true" ]; then
> +                MACHINE=$m EXTRA_TISDK_FILES="${INSTALLER_EXTRAS_ROOT}/${MACHINE}" TISDK_VERSION="${TISDK_VERSION}" bitbake $c 2>&1 | eval tee -a $machine_build_log
> +            else
> +                MACHINE=$m EXTRA_TISDK_FILES="${INSTALLER_EXTRAS_ROOT}/${MACHINE}" TISDK_VERSION="${TISDK_VERSION}" bitbake $c
> +            fi
>  
>              # Check the return status of the build process.  If the build returned
>              # a non-zero exit value then log the failure and continue (without
>              # testing).  A lack of a test file will indicate a test skip
> -            if [ "$?" != "0" ]
> +            if [ "${PIPESTATUS[0]}" != "0" ]
>              then
>                  echo "FAILED" > $LOG_DIR/$m-build-result.txt
>                  build_status="fail"
> -- 
> 1.7.9.5
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago


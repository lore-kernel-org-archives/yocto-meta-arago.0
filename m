Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 6EB3252A9A
	for <meta-arago@arago-project.org>;
	Thu,  4 Sep 2014 17:36:05 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s84Ha4JI026106
	for <meta-arago@arago-project.org>; Thu, 4 Sep 2014 12:36:04 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s84Ha4RI022183
	for <meta-arago@arago-project.org>; Thu, 4 Sep 2014 12:36:04 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 4 Sep 2014 12:36:03 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id s84Ha36M009564;
	Thu, 4 Sep 2014 12:36:03 -0500
Date: Thu, 4 Sep 2014 13:36:03 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <20140904173602.GJ18620@edge>
References: <1409851868-7389-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
In-Reply-To: <1409851868-7389-1-git-send-email-j-stiffler@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [tisdk-build-scripts][PATCH 1/4] config-build-env: Add support for adding a source mirror
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
X-List-Received-Date: Thu, 04 Sep 2014 17:36:05 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Looks good, thanks! Ack.

On Thu, Sep 04, 2014 at 01:31:05PM -0400, Jacob Stiffler wrote:
> * Source mirrors may be used by setting the SOURCE_MIRROR_URL parameter in the
>   configuration file.
> 
> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> ---
>  lib/oesdk/config-build-env |    5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/lib/oesdk/config-build-env b/lib/oesdk/config-build-env
> index 655a7eb..cace93f 100644
> --- a/lib/oesdk/config-build-env
> +++ b/lib/oesdk/config-build-env
> @@ -74,5 +74,10 @@ config_build_dir() {
>      sed -i "s+^SSTATE_DIR =.*+STATE_DIR = \"$BUILD_ROOT/sstate-cache\"+" local.conf
>      sed -i "s+^TMPDIR =.*+TMPDIR = \"$BUILD_ROOT/$build_dir/arago-tmp\"+" local.conf
>      sed -i "s+^export BUILDDIR=.*+export BUILDDIR=\"$BUILD_ROOT/$build_dir\"+" setenv
> +
> +    if [ ! -z "$SOURCE_MIRROR_URL" ]; then
> +      echo "SOURCE_MIRROR_URL = \"$SOURCE_MIRROR_URL\"" >> local.conf
> +      echo "INHERIT += \"own-mirrors\"" >> local.conf
> +    fi
>      cd - > /dev/null 2>&1
>  }
> -- 
> 1.7.9.5
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago


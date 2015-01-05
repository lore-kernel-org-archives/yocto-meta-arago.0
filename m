Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 4249452978
	for <meta-arago@arago-project.org>;
	Mon,  5 Jan 2015 16:02:02 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t05G21A7012919
	for <meta-arago@arago-project.org>; Mon, 5 Jan 2015 10:02:01 -0600
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t05G21x9019148
	for <meta-arago@arago-project.org>; Mon, 5 Jan 2015 10:02:01 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.174.1;
	Mon, 5 Jan 2015 10:02:00 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t05G20Cl006739;
	Mon, 5 Jan 2015 10:02:00 -0600
Date: Mon, 5 Jan 2015 11:02:00 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <20150105160159.GN4759@edge>
References: <1420473061-16355-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
In-Reply-To: <1420473061-16355-1-git-send-email-j-stiffler@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [tisdk-build-scripts][PATCH v2 1/2] config-build-env, package-sdks: Add support to export the downloads to web.
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
X-List-Received-Date: Mon, 05 Jan 2015 16:02:02 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Both patches look good to me, thanks.


On Mon, Jan 05, 2015 at 10:51:00AM -0500, Jacob Stiffler wrote:
> * This can be enabled by setting "EXPORT_ARAGO_SRC" in the config file.
> 
> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> ---
>  lib/oesdk/config-build-env |    8 ++++++++
>  lib/oesdk/package-sdks     |   12 ++++++++++++
>  2 files changed, 20 insertions(+)
> 
> diff --git a/lib/oesdk/config-build-env b/lib/oesdk/config-build-env
> index cace93f..4412987 100644
> --- a/lib/oesdk/config-build-env
> +++ b/lib/oesdk/config-build-env
> @@ -79,5 +79,13 @@ config_build_dir() {
>        echo "SOURCE_MIRROR_URL = \"$SOURCE_MIRROR_URL\"" >> local.conf
>        echo "INHERIT += \"own-mirrors\"" >> local.conf
>      fi
> +
> +    if [ "$EXPORT_ARAGO_SRC" == "1" ]; then
> +      BB_GENERATE_MIRROR_TARBALLS=1
> +    fi
> +
> +    if [ ! -z "$BB_GENERATE_MIRROR_TARBALLS" ]; then
> +      sed -i "s+^BB_GENERATE_MIRROR_TARBALLS =.*+BB_GENERATE_MIRROR_TARBALLS = \"$BB_GENERATE_MIRROR_TARBALLS\"+" local.conf
> +    fi
>      cd - > /dev/null 2>&1
>  }
> diff --git a/lib/oesdk/package-sdks b/lib/oesdk/package-sdks
> index 9bfd887..31a44b6 100644
> --- a/lib/oesdk/package-sdks
> +++ b/lib/oesdk/package-sdks
> @@ -268,6 +268,18 @@ package_web_content() {
>  
>      rm -rf board-support-bin
>  
> +    if [ "$EXPORT_ARAGO_SRC" == "1" ]
> +    then
> +        tar -C $DL_DIR -czf $exports_root/$m-sdk-arago-src-$TISDK_VERSION.tar.gz .
> +
> +        if [ "$?" != 0 ]
> +        then
> +            echo "Could not create arago source tarball"
> +            echo "FAILED" > $LOG_DIR/$m-web-results.txt
> +            return 1
> +        fi
> +    fi
> +
>      # Copy any additional web files that are in the WEB_EXTRAS_ROOT
>      # directory.
>      web_extras="$WEB_EXTRAS_ROOT/$m"
> -- 
> 1.7.9.5
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago


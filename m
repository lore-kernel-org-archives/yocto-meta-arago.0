Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 73490529C2
	for <meta-arago@arago-project.org>;
	Wed, 27 Jan 2016 20:07:37 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id u0RK7a0Y006743
	for <meta-arago@arago-project.org>; Wed, 27 Jan 2016 14:07:37 -0600
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u0RK7aED003596
	for <meta-arago@arago-project.org>; Wed, 27 Jan 2016 14:07:36 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 27 Jan 2016 14:07:36 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id u0RK7abD001162;
	Wed, 27 Jan 2016 14:07:36 -0600
Date: Wed, 27 Jan 2016 15:07:21 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Hongmei Gou <h-gou@ti.com>
Message-ID: <20160127200721.GT11314@edge>
References: <1453924904-16861-1-git-send-email-h-gou@ti.com>
MIME-Version: 1.0
In-Reply-To: <1453924904-16861-1-git-send-email-h-gou@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH] opencv: add version 3.1
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
X-List-Received-Date: Wed, 27 Jan 2016 20:07:37 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Is it "update" and not "add"?

On Wed, Jan 27, 2016 at 03:01:44PM -0500, Hongmei Gou wrote:
> Signed-off-by: Hongmei Gou <h-gou@ti.com>
> ---
>  .../recipes-support/opencv/{opencv_3.0.bb => opencv_3.1.bb}         | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>  copy meta-arago-extras/recipes-support/opencv/{opencv_3.0.bb => opencv_3.1.bb} (97%)
> 
> diff --git a/meta-arago-extras/recipes-support/opencv/opencv_3.0.bb b/meta-arago-extras/recipes-support/opencv/opencv_3.1.bb
> similarity index 97%
> copy from meta-arago-extras/recipes-support/opencv/opencv_3.0.bb
> copy to meta-arago-extras/recipes-support/opencv/opencv_3.1.bb
> index ef56a78..54ddee8 100644
> --- a/meta-arago-extras/recipes-support/opencv/opencv_3.0.bb
> +++ b/meta-arago-extras/recipes-support/opencv/opencv_3.1.bb
> @@ -11,13 +11,13 @@ DEFAULT_PREFERENCE = "-1"
>  
>  DEPENDS = "python-numpy libtool swig swig-native python bzip2 zlib glib-2.0"
>  
> -SRCREV_opencv = "b3ac274617beb8e54c8bfebcb141090a57165ea2"
> -SRCREV_contrib = "c8053da4f2621169746ef8670dc6145ee5958e9c"
> +SRCREV_opencv = "92387b1ef8fad15196dd5f7fb4931444a68bc93a"
> +SRCREV_contrib = "5409d5ad560523c85c6796cc5a009347072d883c"
>  SRCREV_FORMAT = "opencv"
>  SRC_URI = "git://github.com/Itseez/opencv.git;name=opencv \
>             git://github.com/Itseez/opencv_contrib.git;destsuffix=contrib;name=contrib"
>  
> -PV = "3.0+git${SRCPV}"
> +PV = "3.1+git${SRCPV}"
>  
>  S = "${WORKDIR}/git"
>  
> -- 
> 1.9.1
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago


Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 1DCED529AA
	for <meta-arago@arago-project.org>;
	Mon, 20 Jan 2014 22:45:50 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s0KMjnN6013812
	for <meta-arago@arago-project.org>; Mon, 20 Jan 2014 16:45:49 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s0KMjn47007133
	for <meta-arago@arago-project.org>; Mon, 20 Jan 2014 16:45:49 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.2.342.3;
	Mon, 20 Jan 2014 16:45:48 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id s0KMjnVa027958;
	Mon, 20 Jan 2014 16:45:49 -0600
Date: Mon, 20 Jan 2014 17:45:48 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: "Franklin S. Cooper Jr" <fcooper@ti.com>
Message-ID: <20140120224548.GF24768@edge>
References: <1390259818-10267-1-git-send-email-fcooper@ti.com>
	<1390259818-10267-3-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
In-Reply-To: <1390259818-10267-3-git-send-email-fcooper@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH 3/3] packagegroup-arago-test: Add useful testing tools
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
X-List-Received-Date: Mon, 20 Jan 2014 22:45:50 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, Jan 20, 2014 at 05:16:58PM -0600, Franklin S. Cooper Jr wrote:
> * Add two useful testing utilites to the arago filesystem.
> 
> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> ---
>  .../packagegroups/packagegroup-arago-test.bb       |    4 +++-
>  1 files changed, 3 insertions(+), 1 deletions(-)
> 
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test.bb
> index 399eea9..93a980f 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test.bb
> @@ -1,6 +1,6 @@
>  DESCRIPTION = "Extended task to get System Test specific apps"
>  LICENSE = "MIT"
> -PR = "r13"
> +PR = "r14"
>  
>  inherit packagegroup
>  
> @@ -17,6 +17,8 @@ ARAGO_TEST = "\
>      bc \
>      memtester \
>      libdrm-tests \
> +    powertop \

This will add powertop-1.13 from oe-core - is that what you want?
There's 2.3 in meta-linaro, which we don't use, though...

> +    stress \
>      "
>  
>  ARAGO_TI_TEST = "\
> -- 
> 1.7.0.4
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago


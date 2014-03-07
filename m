Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 50F3452A14
	for <meta-arago@arago-project.org>;
	Fri,  7 Mar 2014 20:05:46 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s27K5jFP018370
	for <meta-arago@arago-project.org>; Fri, 7 Mar 2014 14:05:45 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s27K5jaP003314
	for <meta-arago@arago-project.org>; Fri, 7 Mar 2014 14:05:45 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.174.1;
	Fri, 7 Mar 2014 14:05:45 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id s27K5jKH015315;
	Fri, 7 Mar 2014 14:05:45 -0600
Date: Fri, 7 Mar 2014 15:05:44 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Sam Nelson <sam.nelson@ti.com>
Message-ID: <20140307200544.GO22125@edge>
References: <1394222695-22077-1-git-send-email-sam.nelson@ti.com>
MIME-Version: 1.0
In-Reply-To: <1394222695-22077-1-git-send-email-sam.nelson@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [oe-layersetup][PATCH] mcsdk-dylan-config: Update mcsdk-config to use java layer
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
X-List-Received-Date: Fri, 07 Mar 2014 20:05:46 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Thanks, that already went in.

On Fri, Mar 07, 2014 at 03:04:55PM -0500, Sam Nelson wrote:
> - Needed to support openjdk in filesystem for XDC tools native compilation
> 
> Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> ---
>  configs/mcsdk/mcsdk-dylan-config.txt |    1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/configs/mcsdk/mcsdk-dylan-config.txt b/configs/mcsdk/mcsdk-dylan-config.txt
> index 9925642..1489b7b 100644
> --- a/configs/mcsdk/mcsdk-dylan-config.txt
> +++ b/configs/mcsdk/mcsdk-dylan-config.txt
> @@ -8,6 +8,7 @@ meta-qt5,git://github.com/meta-qt5/meta-qt5.git,master,HEAD,layers=
>  meta-openembedded,git://git.openembedded.org/meta-openembedded,dylan,HEAD,layers=toolchain-layer:meta-networking:meta-ruby:meta-oe
>  meta-ti,git://arago-project.org/git/meta-ti.git,dylan,HEAD,layers=
>  meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,dylan,HEAD,layers=meta-linaro-toolchain
> +meta-java,git://github.com/woglinde/meta-java,master,HEAD,layers=
>  oe-core,git://git.openembedded.org/openembedded-core,dylan,HEAD,layers=meta
>  OECORELAYERCONF=./sample-files/bblayers.conf.sample
>  OECORELOCALCONF=./sample-files/local-arago.conf.sample
> -- 
> 1.7.9.5
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago


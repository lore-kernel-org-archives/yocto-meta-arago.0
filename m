Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id BD4D7529C9
	for <meta-arago@arago-project.org>;
	Mon, 22 Jul 2013 16:29:30 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r6MGTUkc007239
	for <meta-arago@arago-project.org>; Mon, 22 Jul 2013 11:29:30 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r6MGTUWR004706
	for <meta-arago@arago-project.org>; Mon, 22 Jul 2013 11:29:30 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.2.342.3;
	Mon, 22 Jul 2013 11:29:29 -0500
Received: from localhost (gtudedge.gt.design.ti.com [158.218.102.158])	by
	dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id r6MGTTFV014329;
	Mon, 22 Jul 2013 11:29:29 -0500
Date: Mon, 22 Jul 2013 12:29:29 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Hingolikar, Mrinmayee" <mrinmayee@ti.com>
Message-ID: <20130722162929.GD30374@edge>
References: <CF956B779D819D41BBC043B7082161D544075F@DBDE04.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <CF956B779D819D41BBC043B7082161D544075F@DBDE04.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH-oe-layersetup 2/2] configs : Override OECORELOCALCONF to use the glsdk.conf.sample.
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
X-List-Received-Date: Mon, 22 Jul 2013 16:29:31 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, Jul 19, 2013 at 06:04:41AM +0000, Hingolikar, Mrinmayee wrote:
>  * The OECORELOCALCONF variable specifies the conf.sample file to be used
>    to generate local.conf.
>  * Overriding it to the GLSDK conf.sample that contains the GLSDK branding.
> 
> Signed-off-by: Mrinmayee Hingolikar <mrinmayee@ti.com>

Ack, but please re-do the first patch by copying it from 
local-amsdk.conf.sample and changing the name/branding accordingly.


> ---
>  configs/glsdk/glsdk-06.01.00-config.txt |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/configs/glsdk/glsdk-06.01.00-config.txt b/configs/glsdk/glsdk-06.01.00-config.txt
> index 051740c..53b05c8 100644
> --- a/configs/glsdk/glsdk-06.01.00-config.txt
> +++ b/configs/glsdk/glsdk-06.01.00-config.txt
> @@ -8,4 +8,4 @@ meta-ti,git://arago-project.org/git/projects/meta-ti-glsdk.git,danny,af963268939
>  meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,danny,d0558fa4304592622423582f8b464e1c22cfe6f1,layers=
>  oe-core,git://git.openembedded.org/openembedded-core,danny,0785489d558c34cacf5cb349949a15e27084efbf,layers=meta
>  OECORELAYERCONF=./sample-files/bblayers.conf.sample
> -OECORELOCALCONF=./sample-files/local-arago.conf.sample
> +OECORELOCALCONF=./sample-files/local-glsdk.conf.sample
> -- 
> 1.7.0.4
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago


Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 85622529A6
	for <meta-arago@arago-project.org>;
	Fri,  9 May 2014 19:09:06 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s49J95Sg006429
	for <meta-arago@arago-project.org>; Fri, 9 May 2014 14:09:05 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s49J95CE030376
	for <meta-arago@arago-project.org>; Fri, 9 May 2014 14:09:05 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.174.1;
	Fri, 9 May 2014 14:09:05 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id s49J95LE014258;
	Fri, 9 May 2014 14:09:05 -0500
Date: Fri, 9 May 2014 15:09:05 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Hingolikar, Mrinmayee" <mrinmayee@ti.com>
Message-ID: <20140509190904.GO18053@edge>
References: <CF956B779D819D41BBC043B7082161D54BA317@DBDE04.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <CF956B779D819D41BBC043B7082161D54BA317@DBDE04.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH] configs: Config for the GLSDK 6.03.00.01
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
X-List-Received-Date: Fri, 09 May 2014 19:09:06 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Did you notice that the patch was corrupted?


On Thu, Apr 24, 2014 at 06:20:43AM +0000, Hingolikar, Mrinmayee wrote:
> Signed-off-by: Vivek Bardia <x0161644@ti.com>
> ---
>  configs/glsdk/glsdk-06.03.00.01-config.txt |   12 ++++++++++++
>  1 file changed, 12 insertions(+)
>  create mode 100644 configs/glsdk/glsdk-06.03.00.01-config.txt
> 
> diff --git a/configs/glsdk/glsdk-06.03.00.01-config.txt b/configs/glsdk/glsdk-06.03.00.01-config.txt
> new file mode 100644
> index 0000000..551a2e6
> --- /dev/null
> +++ b/configs/glsdk/glsdk-06.03.00.01-config.txt
> @@ -0,0 +1,12 @@
> +# This file takes repo entries in the format # repo name,repo uri,repo 
> +branch,repo commit[,layers=layer1:layer2...:layern]
> +
> +bitbake,git://git.openembedded.org/bitbake,master,bbb4fa427739912ff3b87
> +379bf629066f6662458,layers= 
> +meta-arago,git://arago-project.org/git/projects/meta-arago-glsdk.git,ma
> +ster,b838c23aae724496b3aee48b5daa0f458e0526c1,layers=meta-arago-distro:
> +meta-arago-extras 
> +meta-qt5,git://github.com/meta-qt5/meta-qt5.git,master,775d77e482f1ea20
> +3c78003cccd2547075fd720f,layers= 
> +meta-openembedded,git://git.openembedded.org/meta-openembedded,dylan,44
> +754206632dd5b0725aeb43e99e4ff9e0245dca,layers=toolchain-layer:meta-netw
> +orking:meta-ruby:meta-oe 
> +meta-ti,git://arago-project.org/git/projects/meta-ti-glsdk.git,dylan,69
> +1ad445d8d55971ac787a60516aaf91bc4bc3a3,layers=
> +meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,dylan,c9f
> +78d6eff14ada3f2bc960e81883b27a10afecc,layers=meta-linaro-toolchain
> +oe-core,git://git.openembedded.org/openembedded-core,dylan,394fa61d00b9
> +7c19610bfb38f02174c4e8aeeb15,layers=meta
> +OECORELAYERCONF=./sample-files/bblayers.conf.sample
> +OECORELOCALCONF=./sample-files/local-arago.conf.sample
> --
> 1.7.9.5
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago


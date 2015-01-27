Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 62584529B3
	for <meta-arago@arago-project.org>;
	Tue, 27 Jan 2015 21:27:53 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t0RLRqu7022174
	for <meta-arago@arago-project.org>; Tue, 27 Jan 2015 15:27:52 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t0RLRpud003852
	for <meta-arago@arago-project.org>; Tue, 27 Jan 2015 15:27:51 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 27 Jan 2015 15:27:51 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t0RLRpAG015213;
	Tue, 27 Jan 2015 15:27:51 -0600
Date: Tue, 27 Jan 2015 16:27:50 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Carlos Hernandez <ceh@ti.com>
Message-ID: <20150127212750.GO21328@edge>
References: <1422392812-16627-1-git-send-email-ceh@ti.com>
MIME-Version: 1.0
In-Reply-To: <1422392812-16627-1-git-send-email-ceh@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH] Update linaro-pm-qa-utils package version
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
X-List-Received-Date: Tue, 27 Jan 2015 21:27:53 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Jan 27, 2015 at 04:06:52PM -0500, Carlos Hernandez wrote:
> The old version contains bugs, such as false negatives on cpuidle
> tests, so update to latest version that contains this on other
> fixes.
> 
> Signed-off-by: Carlos Hernandez <ceh@ti.com>

Acked-by: Denys Dmytriyenko <denys@ti.com>


> ---
>  .../recipes-devtools/linaro-pm-qa/linaro-pm-qa-utils_git.bb           | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-arago-extras/recipes-devtools/linaro-pm-qa/linaro-pm-qa-utils_git.bb b/meta-arago-extras/recipes-devtools/linaro-pm-qa/linaro-pm-qa-utils_git.bb
> index a836a8d..9768a46 100644
> --- a/meta-arago-extras/recipes-devtools/linaro-pm-qa/linaro-pm-qa-utils_git.bb
> +++ b/meta-arago-extras/recipes-devtools/linaro-pm-qa/linaro-pm-qa-utils_git.bb
> @@ -5,10 +5,10 @@ LICENSE = "GPLv2"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
>  
>  PV = "0.4.4"
> -PR = "r2"
> +PR = "r3"
>  
>  BRANCH ?= "master"
> -SRCREV = "fbc2762359b863dfbf4fd0bab1e8abd2a6125ed4"
> +SRCREV = "bdd94ec9204151ba845e9c057de92360c63bbffb"
>  
>  SRC_URI = "git://git.linaro.org/tools/pm-qa.git;protocol=git;branch=${BRANCH}"
>  
> -- 
> 1.9.1
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago


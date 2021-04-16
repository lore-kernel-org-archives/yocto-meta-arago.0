Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id D2E7752B98
	for <meta-arago@arago-project.org>;
	Fri, 16 Apr 2021 19:45:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id E0C3340C81;
	Fri, 16 Apr 2021 19:46:18 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id b40agtbntk5M; Fri, 16 Apr 2021 19:46:18 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id ABF3C407E5;
	Fri, 16 Apr 2021 19:46:15 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 0D2441745B6; Fri, 16 Apr 2021 15:46:15 -0400 (EDT)
Date: Fri, 16 Apr 2021 15:46:14 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Gowtham Tammana <g-tammana@ti.com>
Message-ID: <20210416194614.GA15937@denix.org>
References: <20210416193053.31664-1-g-tammana@ti.com>
MIME-Version: 1.0
In-Reply-To: <20210416193053.31664-1-g-tammana@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org, denys@konsulko.com
Subject: Re: [dunfell/master][PATCH] ti-test: fix string expansion
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
X-List-Received-Date: Fri, 16 Apr 2021 19:45:54 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Apr 16, 2021 at 02:30:53PM -0500, Gowtham Tammana wrote:
> bb conditional util expansion was done in '' causing the below error
> 
> ```
> bb.data_smart.ExpansionError: Failure expanding variable ARAGO_TI_TEST, expression was ... ${@bb.utils.contains('MACHINE_FEATURES', 'mmip', 'omapdrmtest', '', d)} cmem-test     ', d)}
> which triggered exception SyntaxError: invalid syntax (Var <ARAGO_TI_TEST>, line 1)
> ```
> 
> fixed the expansion to within "".

Seems to have no issues in master, but yeah, good catch.


> Signed-off-by: Gowtham Tammana <g-tammana@ti.com>

Reviewed-by: Denys Dmytriyenko <denys@konsulko.com>


> ---
>  meta-arago-distro/recipes-core/packagegroups/ti-test.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-arago-distro/recipes-core/packagegroups/ti-test.bb b/meta-arago-distro/recipes-core/packagegroups/ti-test.bb
> index 5b04d85c..cbc246d5 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/ti-test.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/ti-test.bb
> @@ -68,11 +68,11 @@ ARAGO_TI_TEST_append_ti43x = " \
>  
>  ARAGO_TI_TEST_append_omap-a15 = " \
>      omapconf \
> -    ${@oe.utils.conditional('ARAGO_BRAND', 'mainline', '', ' \
> +    ${@oe.utils.conditional('ARAGO_BRAND', 'mainline', '', " \
>          ti-ipc-test \
>          ${@bb.utils.contains('MACHINE_FEATURES', 'mmip', 'omapdrmtest', '', d)} \
>          cmem-test \
> -    ', d)} \
> +    ", d)} \
>  "
>  
>  ARAGO_TI_TEST_append_k3 = " \


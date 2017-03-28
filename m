Return-Path: <denys@ti.com>
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by arago-project.org (Postfix) with ESMTPS id 7E54F5296D
	for <meta-arago@arago-project.org>;
	Tue, 28 Mar 2017 21:44:11 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id v2SLiBGl018867
	for <meta-arago@arago-project.org>; Tue, 28 Mar 2017 16:44:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1490737451;
	bh=EXrTjpjtF7iRA0wCA41paMzo3NXA8MUdDAUsuunTtG8=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=ds/bVGW3Gikb6OQssbetFFpl+ETCzLzz2jtmjvrrvjCfaH/xoQhJ/d0G2fih9iqZk
	vjvyGdiTpM9mTaQ0PY/t/Lxkryc0pb+AdUl62ke16rtz9V2zB2TfYtem/m+5bqQPDW
	K5p31LBij+FhgB1m/deEaZxDh++mxx6D9UdUazXI=
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v2SLiBcP024491
	for <meta-arago@arago-project.org>; Tue, 28 Mar 2017 16:44:11 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 28 Mar 2017 16:44:10 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v2SLiBtP018705;
	Tue, 28 Mar 2017 16:44:11 -0500
Date: Tue, 28 Mar 2017 17:44:10 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Eric Ruei <e-ruei1@ti.com>
Message-ID: <20170328214410.GO29187@edge>
References: <1490649999-28776-1-git-send-email-e-ruei1@ti.com>
MIME-Version: 1.0
In-Reply-To: <1490649999-28776-1-git-send-email-e-ruei1@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [krogoth][PATCH] omapdrmtest: Update tests to handle disabled HDMI
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
X-List-Received-Date: Tue, 28 Mar 2017 21:44:11 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Same question as kmscube

On Mon, Mar 27, 2017 at 05:26:39PM -0400, Eric Ruei wrote:
> Signed-off-by: Eric Ruei <e-ruei1@ti.com>
> ---
>  meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb b/meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb
> index e08e8e3..d4b42a8 100644
> --- a/meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb
> +++ b/meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb
> @@ -7,7 +7,7 @@ DEPENDS += "libav libdce libdrm libgbm ti-sgx-ddk-um wayland"
>  inherit autotools pkgconfig
>  
>  PR = "r19"
> -SRCREV = "47bbb6b2ec48bbee35f9dc7192c05e48fd1a2589"
> +SRCREV = "116c940c2b06b221c13be28bb79af49233ba462a"
>  
>  SRC_URI = "git://git.ti.com/glsdk/omapdrmtest.git;protocol=git \
>  "
> -- 
> 1.9.1
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago


Return-Path: <denys@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id 09B8F52986
	for <meta-arago@arago-project.org>;
	Wed,  4 Apr 2018 17:54:39 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id w34HscRv001502;
	Wed, 4 Apr 2018 12:54:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1522864478;
	bh=pM4/kIL7hZbwRGEkkRw1s5GDH3UcVfjfAGgNDlB3f1U=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=OIFycZMg76Czz4CjhOFgzrdznpOV4jkmw59DN4uVadTJLYznv3Lo93fJxGNcejLcF
	sjlssCNAJBnQQv/gdTaXXBWz2xZz0boSfi5kaTviWs0tpQhdt7nB9j+aTj7QZ3o6IZ
	MdeYL0CvoACKY/dVA20gDaNnL9gt0JA61bSB7nJI=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w34Hsckf026796;
	Wed, 4 Apr 2018 12:54:38 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Wed, 4 Apr 2018 12:54:37 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE100.ent.ti.com
	(157.170.170.30) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Wed, 4 Apr 2018 12:54:38 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w34HsbFE032685;
	Wed, 4 Apr 2018 12:54:37 -0500
Date: Wed, 4 Apr 2018 13:54:37 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
Message-ID: <20180404175437.GG32427@edge>
References: <1522834047-15232-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <1522834047-15232-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH] remove the layer directories
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
X-List-Received-Date: Wed, 04 Apr 2018 17:54:41 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Apr 04, 2018 at 05:27:26PM +0800, Huang Qiyu wrote:
> Meta-arago writes all the dependent layer directories to the bblayer, which caused to
> add these dependent layers to build environment even though only need one of them.
> This is obviously unreasonable.

Huh? No, this change is not correct. NAK.


> Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
> ---
>  meta-arago-distro/conf/layer.conf | 13 -------------
>  meta-arago-extras/conf/layer.conf | 10 ----------
>  2 files changed, 23 deletions(-)
> 
> diff --git a/meta-arago-distro/conf/layer.conf b/meta-arago-distro/conf/layer.conf
> index c175bd8..260efed 100644
> --- a/meta-arago-distro/conf/layer.conf
> +++ b/meta-arago-distro/conf/layer.conf
> @@ -8,19 +8,6 @@ BBFILE_COLLECTIONS += "meta-arago-distro"
>  BBFILE_PATTERN_meta-arago-distro := "^${LAYERDIR}/"
>  BBFILE_PRIORITY_meta-arago-distro = "10"
>  
> -LAYERDEPENDS_meta-arago-distro = " \
> -    core \
> -    meta-ti \
> -    openembedded-layer \
> -    networking-layer \
> -    meta-python \
> -    linaro-toolchain \
> -    meta-optee \
> -    qt5-layer \
> -    browser-layer \
> -    meta-arago-extras \
> -"
> -
>  BB_DANGLINGAPPENDS_WARNONLY = "true"
>  
>  SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
> diff --git a/meta-arago-extras/conf/layer.conf b/meta-arago-extras/conf/layer.conf
> index 83ac107..605d083 100644
> --- a/meta-arago-extras/conf/layer.conf
> +++ b/meta-arago-extras/conf/layer.conf
> @@ -13,16 +13,6 @@ ARAGOBASE := '${@os.path.normpath("${LAYERDIR}/../")}'
>  
>  LICENSE_PATH += "${LAYERDIR}/licenses"
>  
> -LAYERDEPENDS_meta-arago-extras = " \
> -    core \
> -    meta-ti \
> -    openembedded-layer \
> -    networking-layer \
> -    meta-python \
> -    linaro-toolchain \
> -    qt5-layer \
> -"
> -
>  SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
>      matrix-gui-multimedia-demos->amsdk-av-files \
>      matrix-gui-oprofile-demos->oprofile \
> -- 
> 2.7.4
> 
> 
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago


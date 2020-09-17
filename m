Return-Path: <denys@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id B4B1D52970
	for <meta-arago@arago-project.org>;
	Thu, 17 Sep 2020 18:52:34 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 08HIncwC085391
	for <meta-arago@arago-project.org>; Thu, 17 Sep 2020 13:49:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1600368578;
	bh=DmTrbFdKGeKTYtyLZN6ZD5Qd/tGYZ9oeKDuZBubEC5g=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=al8KlagxNY1qeoCAACTsq/kePteJIUSD5lh9dKuWXzxCUyBbf5c3T4XF4tcMd2zyb
	pXcfp4QrMc+KoSsFttfMAfbIcZ+Gj/LTThpQTkpR/zDnTMe0pL0OEVPwpe7XI916IG
	AU9jeeVXzFyOKFw6DCFbiCYE1+u7tLAd0plcVFH8=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 08HIncCT117237
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Thu, 17 Sep 2020 13:49:38 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3;
	Thu, 17 Sep 2020 13:49:38 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE101.ent.ti.com
	(10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
	Frontend Transport; Thu, 17 Sep 2020 13:49:38 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 08HInctU067953;
	Thu, 17 Sep 2020 13:49:38 -0500
Date: Thu, 17 Sep 2020 14:49:38 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Gowtham Tammana <g-tammana@ti.com>
Message-ID: <20200917184938.GH13699@beryl>
References: <20200917184647.3292-1-g-tammana@ti.com>
MIME-Version: 1.0
In-Reply-To: <20200917184647.3292-1-g-tammana@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org, k-bhargav@ti.com
Subject: Re: [dunfell][PATCH 1/2] layer conf: Add meta-python2
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
X-List-Received-Date: Thu, 17 Sep 2020 18:52:35 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

NAK

On Thu, Sep 17, 2020 at 01:46:46PM -0500, Gowtham Tammana wrote:
> meta-python2 is needed for qtwebengine, so add this to layer conf.
> 
> Signed-off-by: Gowtham Tammana <g-tammana@ti.com>
> ---
>  meta-arago-distro/conf/layer.conf | 1 +
>  meta-arago-extras/conf/layer.conf | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/meta-arago-distro/conf/layer.conf b/meta-arago-distro/conf/layer.conf
> index 9281ceb5..0c69d433 100644
> --- a/meta-arago-distro/conf/layer.conf
> +++ b/meta-arago-distro/conf/layer.conf
> @@ -16,6 +16,7 @@ LAYERDEPENDS_meta-arago-distro = " \
>      openembedded-layer \
>      networking-layer \
>      meta-python \
> +    meta-python2 \
>      qt5-layer \
>      meta-arago-extras \
>  "
> diff --git a/meta-arago-extras/conf/layer.conf b/meta-arago-extras/conf/layer.conf
> index 7e3081b2..9d06a9f2 100644
> --- a/meta-arago-extras/conf/layer.conf
> +++ b/meta-arago-extras/conf/layer.conf
> @@ -21,6 +21,7 @@ LAYERDEPENDS_meta-arago-extras = " \
>      openembedded-layer \
>      networking-layer \
>      meta-python \
> +    meta-python2 \
>      arm-toolchain \
>      qt5-layer \
>  "
> -- 
> 2.28.0
> 


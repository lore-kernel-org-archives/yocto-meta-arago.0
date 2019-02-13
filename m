Return-Path: <denys@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 68AA9529B0
	for <meta-arago@arago-project.org>;
	Wed, 13 Feb 2019 01:48:54 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x1D1mebu087594
	for <meta-arago@arago-project.org>; Tue, 12 Feb 2019 19:48:40 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1550022520;
	bh=RsBIcqbNXxaz3fio22on87Xfw3WC2LZm3zJqSUngkCw=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=ErzR9E2MJDRIwy+EiU92q0+WhiWYRdy+mLG3/vAZbOOkO7Ba9Yz5vcrLRp6Tq9HKp
	wOrB6+zEw9O8gfwD2yaa72H3D1nOXtzZEI8Zdx8EMZ80StSATBv2AO9VxlUSMpyMkC
	kS/+AKtA60gzipuwCW1YfxkybwyYfVq7ChiAmthQ=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x1D1mefA126843
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 12 Feb 2019 19:48:40 -0600
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Tue, 12 Feb 2019 19:48:39 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE105.ent.ti.com
	(157.170.170.35) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Tue, 12 Feb 2019 19:48:39 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id x1D1mdYj018247;
	Tue, 12 Feb 2019 19:48:39 -0600
Date: Tue, 12 Feb 2019 20:48:39 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Manisha Agrawal <manisha.agrawal@ti.com>
Message-ID: <20190213014839.GA4386@beryl>
References: <20190204174300.13373-1-manisha.agrawal@ti.com>
MIME-Version: 1.0
In-Reply-To: <20190204174300.13373-1-manisha.agrawal@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [rocko/master][PATCH v1] matrix-gui-apps: bump SRCREV to get the mmwavegesture-hmi changes
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
X-List-Received-Date: Wed, 13 Feb 2019 01:48:54 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, Feb 04, 2019 at 11:43:00AM -0600, Manisha Agrawal wrote:
> Signed-off-by: Manisha Agrawal <manisha.agrawal@ti.com>
> ---
>  meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
> index d74f889..1781134 100644
> --- a/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
> +++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
> @@ -4,9 +4,9 @@ LICENSE_CHECKSUM = "LICENSE;md5=6e0ae7214f6c74c149cb25f373057fa9"
>  LIC_FILES_CHKSUM := "file://../${LICENSE_CHECKSUM}"
>  
>  SRC_URI = "git://git.ti.com/matrix-gui-v2/matrix-gui-v2-apps.git;protocol=git;branch=${BRANCH}"
> -SRCREV = "20f1f86c7b8ec9e1ccc52953fb2a9bac74e23efd"
> +SRCREV = "94e9f17332065fa838d9334efdab8451c8119b8d"
>  BRANCH = "master"
> -INC_PR = "r64"
> -
> +INC_PR = "r65"
> +i

^^^^ ???


>  # Pull in the base package for installing matrix applications
>  require matrix-gui-apps.inc
> -- 
> 2.13.0
> 


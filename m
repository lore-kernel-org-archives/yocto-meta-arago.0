Return-Path: <denys@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id C9948520DE
	for <meta-arago@arago-project.org>;
	Fri,  6 Sep 2019 13:13:24 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x86DCKFC005395
	for <meta-arago@arago-project.org>; Fri, 6 Sep 2019 08:12:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1567775540;
	bh=jd4i9hRTRhx3b+nVHYop17dyMUcd50UQsjS5pCVBc6k=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=eLCNrR1HfreCNgO5ZV5mJcznWCFB7IHmFAnprLqirMWlycKUaL2H1gq7WYWt4yl9T
	hjeotDUvjdTAG7kmV+G1sEtyLRnlGBr2THAQGCBZ0GIcUtXJ90OfH0oQpehdprvqIA
	bTwA5ij5bYv28nSdw7XiN4mDaGkjlbPkUOIIsFdU=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x86DCK86108480
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Fri, 6 Sep 2019 08:12:20 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Fri, 6 Sep 2019 08:12:20 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE100.ent.ti.com
	(157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Fri, 6 Sep 2019 08:12:20 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x86DCKwu022629;
	Fri, 6 Sep 2019 08:12:20 -0500
Date: Fri, 6 Sep 2019 09:12:19 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Nikhil Devshatwar <nikhil.nd@ti.com>
Message-ID: <20190906131219.GB2400@beryl>
References: <1567760584-24235-1-git-send-email-nikhil.nd@ti.com>
MIME-Version: 1.0
In-Reply-To: <1567760584-24235-1-git-send-email-nikhil.nd@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [ [thud/master] PATCH v1] recipes-devtools: libion: New recipe for ion library
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
X-List-Received-Date: Fri, 06 Sep 2019 13:13:25 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Please retain original authorthip.

On Fri, Sep 06, 2019 at 02:33:04PM +0530, Nikhil Devshatwar wrote:
> Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
> ---
>  meta-arago-extras/recipes-devtools/ion/libion_git.bb | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>  create mode 100644 meta-arago-extras/recipes-devtools/ion/libion_git.bb
> 
> diff --git a/meta-arago-extras/recipes-devtools/ion/libion_git.bb b/meta-arago-extras/recipes-devtools/ion/libion_git.bb
> new file mode 100644
> index 0000000..7c93ed3
> --- /dev/null
> +++ b/meta-arago-extras/recipes-devtools/ion/libion_git.bb
> @@ -0,0 +1,14 @@
> +SUMMARY = "ION Userspace Memory Allocator Library"
> +HOMEPAGE = "https://github.com/glneo/libion"
> +LICENSE = "Apache-2.0"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
> +
> +PV = "1.0.0"
> +
> +BRANCH = "master"
> +SRC_URI = "git://github.com/glneo/libion.git;protocol=git;branch=${BRANCH}"
> +SRCREV = "11dad7977ec3ecba37c013da7ec0408c01413000"
> +
> +S = "${WORKDIR}/git"
> +
> +inherit cmake pkgconfig
> -- 
> 1.9.1
> 


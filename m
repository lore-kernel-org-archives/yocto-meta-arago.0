Return-Path: <denys@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 5EE5E520DF
	for <meta-arago@arago-project.org>;
	Thu, 12 Sep 2019 16:44:48 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8CGhgu6030885
	for <meta-arago@arago-project.org>; Thu, 12 Sep 2019 11:43:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1568306622;
	bh=c+KIaME7002xFvpANx2G913qeKczfMVjztei81D1KzU=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=FuEbzssuuikEI8whCHBGvD0jJ3WhvLN6J9kp5VS9bXrOgwM6QiiieZDj9s3UISeNz
	/3TxWIXHobZU8NeJiyTELsqDUqDJ6hFrsNOTZKfyqvbxCywrlc2TcbbybvV4pgh+Ze
	AX18aj1GFV4/swYQmQvZqhPaTgqsrLJGo2Wa4aR4=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8CGhgXw033016
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Thu, 12 Sep 2019 11:43:42 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Thu, 12 Sep 2019 11:43:42 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE111.ent.ti.com
	(10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Thu, 12 Sep 2019 11:43:41 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8CGhfie014968;
	Thu, 12 Sep 2019 11:43:42 -0500
Date: Thu, 12 Sep 2019 12:43:41 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Nikhil Devshatwar <nikhil.nd@ti.com>
Message-ID: <20190912164341.GG28369@beryl>
References: <1568098140-193923-1-git-send-email-nikhil.nd@ti.com>
	<1568098140-193923-2-git-send-email-nikhil.nd@ti.com>
MIME-Version: 1.0
In-Reply-To: <1568098140-193923-2-git-send-email-nikhil.nd@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [thud PATCH v2 2/3] recipes-devtools: libion: New recipe for ion library
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
X-List-Received-Date: Thu, 12 Sep 2019 16:44:48 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Thanks, what about the test suite for ION?

And I was planning to add those to meta-ti anyway...


On Tue, Sep 10, 2019 at 12:18:59PM +0530, Nikhil Devshatwar wrote:
> From: Denys Dmytriyenko <denys@ti.com>
> 
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
> ---
> Changes from v1:
> * Retained original authorship
> 
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


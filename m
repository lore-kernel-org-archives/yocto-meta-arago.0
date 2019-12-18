Return-Path: <j-stiffler@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 200EE529BC
	for <meta-arago@arago-project.org>;
	Wed, 18 Dec 2019 19:17:03 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBIJFQR2016173
	for <meta-arago@arago-project.org>; Wed, 18 Dec 2019 13:15:26 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1576696526;
	bh=LA02ObzzOLNtUXR6mwhNXiY1eNLxFvrOr2vDvOVCAp8=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=Icqa23gavCK83Lve804tTYERf3NYWz3jk4j25SIznyv81zdDdYCQKkfbxB3d4hczC
	KpOaanlM/aet+JSatg4OxdSvcv0T+f1KUaF0Cc1enjr8nl8gSEnhuDW4uNZ44BPjDJ
	LS0MdV0yWDSRL9kPfr2UDOhdupnzsxNvEhSotRkU=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xBIJFQAt034322
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Wed, 18 Dec 2019 13:15:26 -0600
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE105.ent.ti.com
	(10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Wed, 18 Dec 2019 13:15:25 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE110.ent.ti.com
	(10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Wed, 18 Dec 2019 13:15:25 -0600
Received: from [158.218.113.191] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBIJFPlx001725
	for <meta-arago@arago-project.org>; Wed, 18 Dec 2019 13:15:25 -0600
To: <meta-arago@arago-project.org>
References: <1576615614-32467-1-git-send-email-j-stiffler@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <4b28afa8-4429-a91a-4d24-5794b60ff9e2@ti.com>
Date: Wed, 18 Dec 2019 14:15:25 -0500
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <1576615614-32467-1-git-send-email-j-stiffler@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [master/thud/ti2019.05][PATCH] ti-tisdk-setup: bump SRCREV for early boot support
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
X-List-Received-Date: Wed, 18 Dec 2019 19:17:03 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Denys,

Please backport to ti2019.05.


Thank you,

Jake

On 12/17/2019 3:46 PM, Jacob Stiffler wrote:
> * Add early boot support to create-sdcard.sh by installing early boot
>    firmware into boot partition.
>
> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> ---
>   meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb
> index 9a9368d..5ef9ef8 100644
> --- a/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb
> +++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb
> @@ -2,10 +2,10 @@ DESCRIPTION = "Package containing scripts to setup the development host and targ
>   LICENSE = "BSD"
>   LIC_FILES_CHKSUM = "file://setup.sh;beginline=3;endline=31;md5=fc4b04a33df6d892c9f4d4a9d92b945e"
>   
> -PR = "r44"
> +PR = "r45"
>   
>   BRANCH ?= "master"
> -SRCREV = "22654923e4597871ba192e58c01d6fc09a38aae4"
> +SRCREV = "42a8379fda829f34c374ddfca0242a479a84d454"
>   SRC_URI = "git://arago-project.org/git/projects/tisdk-setup-scripts.git;protocol=git;branch=${BRANCH}"
>   
>   S = "${WORKDIR}/git/"


Return-Path: <j-stiffler@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id 24CA9520EA
	for <meta-arago@arago-project.org>;
	Tue, 25 Jun 2019 19:17:49 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5PJH5ZK059126
	for <meta-arago@arago-project.org>; Tue, 25 Jun 2019 14:17:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1561490225;
	bh=jmZFU5eK47azCKDk781JBgltZLLsdScE/k373xTbfzo=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=CR+4Cr72PrE93cVZPpeIRGX4msRRHq2bFC842YDid9Fh9o57+R0C6kntZ5GuW3rU4
	l/JN90HWUxqOErqSyuOb9s5Dm3KM4h7I23GRd6Jgx70+2z8cQm9yz/xLNGVTjQmmv5
	tNkDKsgORPhMyGw9bUGt19rUPgvnptFQAtNfkeT0=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5PJH5qR114946
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 25 Jun 2019 14:17:05 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE103.ent.ti.com
	(10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Tue, 25 Jun 2019 14:17:05 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Tue, 25 Jun 2019 14:17:05 -0500
Received: from [158.218.113.191] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5PJH5L5045464
	for <meta-arago@arago-project.org>; Tue, 25 Jun 2019 14:17:05 -0500
To: <meta-arago@arago-project.org>
References: <1561393829-28163-1-git-send-email-j-stiffler@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <256fdf49-95f8-fe0d-73fc-d768be45cb5d@ti.com>
Date: Tue, 25 Jun 2019 15:17:05 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <1561393829-28163-1-git-send-email-j-stiffler@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [master/thud/ti2019.01][PATCH] ti-tisdk-setup: bump SRCREV for create-sdcard update
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
X-List-Received-Date: Tue, 25 Jun 2019 19:17:49 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Denys,

Can you please back-port this to ti2019.01?


Thank you,

Jake

On 6/24/2019 12:30 PM, Jacob Stiffler wrote:
> * sort rootfs images by decreasing size
>
> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> ---
>   meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb
> index f0ec287..93b2d6f 100644
> --- a/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb
> +++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb
> @@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://setup.sh;beginline=3;endline=31;md5=fc4b04a33df6d892c
>   PR = "r42"
>   
>   BRANCH ?= "master"
> -SRCREV = "b33c55bee6591c681e3b3c2ea243bce581b13c31"
> +SRCREV = "9d048a26007f1c36823d3bfa520c1adf47172cec"
>   SRC_URI = "git://arago-project.org/git/projects/tisdk-setup-scripts.git;protocol=git;branch=${BRANCH}"
>   
>   S = "${WORKDIR}/git/"


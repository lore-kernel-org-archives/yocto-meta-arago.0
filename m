Return-Path: <l-weaver@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTP id 6BF8E529B7
	for <meta-arago@arago-project.org>;
	Mon,  2 Aug 2021 17:54:53 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 172Ht9sv069808;
	Mon, 2 Aug 2021 12:55:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1627926909;
	bh=x593kFj8l+RuJyuOlqkmXHihnhUzEJEoSAtNyDfESdI=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=l0uPKoNMtBykDSUkoEAKxekEbbdOFjq7ZWQj7W/Fli0+AV+O4fhlWipbxoBQH/3D7
	NyC0jgX79zI1bYumxRf1EcMcGpDjXogI7DVeldTqNuN/FvFHK/zo76PMoNlc+J0ncs
	S3mRp+Be10c6qbUXC/y+ndDrqBntoso31BzWK7ug=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 172Ht97I034046
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 2 Aug 2021 12:55:09 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2;
	Mon, 2 Aug 2021 12:55:08 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE107.ent.ti.com
	(10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
	Frontend Transport; Mon, 2 Aug 2021 12:55:08 -0500
Received: from [10.250.67.26] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 172Ht86B092904;
	Mon, 2 Aug 2021 12:55:08 -0500
To: Priya N S <priya.ns@mistralsolutions.com>, <meta-arago@arago-project.org>
References: <20210729125011.9120-1-priya.ns@ti.com>
From: "Weaver, Lucas" <l-weaver@ti.com>
Message-ID: <61e6c90f-2c6b-5879-66f6-4d6f8b4c9854@ti.com>
Date: Mon, 2 Aug 2021 12:55:08 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
	Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210729125011.9120-1-priya.ns@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Priya N S <priya.ns@ti.com>, Sekhar Nori <nsekhar@ti.com>
Subject: Re: [EXTERNAL] [tisdk-setup-scripts] [master] [PATCH-V4 0/4] create-sdcard: Fix rootfs tarball search and selection
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
X-List-Received-Date: Mon, 02 Aug 2021 17:54:53 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 7/29/2021 7:50 AM, Priya N S wrote:
> Hi All,
> 
> This series of patches fix the issues observed in the create-sdcard
> script.
> 
> Changes in V4:
> The patch #4 is new in the series. This patch increases the boot
> partition size to 128 MB in order to sync with WIC image boot
> partition size.
> 
> v3:
> http://arago-project.org/pipermail/meta-arago/2021-July/013245.html
> v2:
> http://arago-project.org/pipermail/meta-arago/2021-June/013218.html
> v1:
> http://arago-project.org/pipermail/meta-arago/2021-June/013197.html
> 
> 
> Priya N S (4):
>    create-sdcard.sh: fix regex used for rootfs tarball
>    create-sdcard: Fix wrong rootfs tarball selection
>    create-sdcard.sh: Stop using cylinder as unit for partition size
>    create-sdcard: Increase boot partition size to 128 MB
> 
>   create-sdcard.sh | 76 ++++++++++++++++++++++++++++++++++++------------
>   1 file changed, 58 insertions(+), 18 deletions(-)
> 
Reviewed-by: Lucas Weaver <l-weaver@ti.com>


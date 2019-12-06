Return-Path: <nikhil.nd@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 960FE529D6
	for <meta-arago@arago-project.org>;
	Fri,  6 Dec 2019 14:04:49 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id xB6E3GIc093310
	for <meta-arago@arago-project.org>; Fri, 6 Dec 2019 08:03:16 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1575640996;
	bh=WMaD2wfFuAFi4+05BufACNfkve5yMfZwMJUmcCMty9g=;
	h=Subject:From:To:References:Date:In-Reply-To;
	b=UCTecZ5e5re0/Q2fD6+VBRa82dgUzxMlEFMCH4eZhMCweAF0+pBsv3r1HWs1ZquAZ
	tcRTwUmAnuYv9lKg+K5BdO4ypmnSJZOvZKMdh56BYL8uYJPnIvGoe297OdHZ6PkGq9
	Op6v2HMXZmgM1BzVyuOQnwNnAdLr+/45p5fkUVKU=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xB6E3GXA071146
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Fri, 6 Dec 2019 08:03:16 -0600
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE106.ent.ti.com
	(157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Fri, 6 Dec 2019 08:03:16 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Fri, 6 Dec 2019 08:03:16 -0600
Received: from [172.24.190.110] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id xB6E3Fxh058179
	for <meta-arago@arago-project.org>; Fri, 6 Dec 2019 08:03:15 -0600
From: Nikhil Devshatwar <nikhil.nd@ti.com>
To: <meta-arago@arago-project.org>
References: <d69f529f-7780-8279-7a4f-d84cfb655ddc@ti.com>
Message-ID: <cf5ee0cf-0a5f-9ad2-8f7e-d7826af3491b@ti.com>
Date: Fri, 6 Dec 2019 19:32:47 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <d69f529f-7780-8279-7a4f-d84cfb655ddc@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: Adding postinst script with dependencies
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
X-List-Received-Date: Fri, 06 Dec 2019 14:04:49 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 06/12/19 1:00 pm, Nikhil Devshatwar wrote:
> Hi all,
>
> I was working on a demo package recipe where I want to update files 
> being installed by other package.
>
> For this, I went about adding a postinst function
>
> e.g. oob-demo package DEPENDS on weston-conf
>
> I have a postinst function in oob-demo which updates a file 
> (/etc/weston.ini) as part of installation
>
> This works fine if I install the oob-demo IPK in the existing target.
>
> However, the yocto build fails when I try to build the 
> tisdk-rootfs-image.


Got this working, had to prepend with $D to point to any paths postinst 
script was using.

This got replaced with the path to rootfs and I could see the file 
getting patched.


Regards,

Nikhil D

>
> I understood that the postinst functions get called alphabetically, 
> and DEPENDS is not respected there.
>
> https://www.yoctoproject.org/pipermail/poky/2012-June/007984.html
>
>
> Is there any better way to achieve this?
>
>
> Regards,
>
> Nikhil D
>
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago


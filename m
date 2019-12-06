Return-Path: <nikhil.nd@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id A9E1B52A21
	for <meta-arago@arago-project.org>;
	Fri,  6 Dec 2019 07:32:48 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id xB67VFvs017700
	for <meta-arago@arago-project.org>; Fri, 6 Dec 2019 01:31:15 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1575617475;
	bh=TQ7tUROzgUD0zcqEQPQD0xDyiLILWGcaATxjrTUcq6Q=;
	h=To:From:Subject:Date;
	b=RijwWR/UB/yLL3hllMAc5zknUkIsqkKWn91lzXpjAYQh+GHYXrdyy3g1w2tUifXT1
	+gRt/gCAVeWkG/o84cyEJY3Glwa7GheyC5P7zM8cN+EtxZdP/VKbDeN7Cmfg2polvs
	Q5fw92t64KH7yNHn5RV03kgniLq8i39/7cBei8Yo=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xB67VFZd037219
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Fri, 6 Dec 2019 01:31:15 -0600
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE107.ent.ti.com
	(157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Fri, 6 Dec 2019 01:31:15 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE106.ent.ti.com
	(157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Fri, 6 Dec 2019 01:31:15 -0600
Received: from [172.24.190.110] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id xB67VEA7001933
	for <meta-arago@arago-project.org>; Fri, 6 Dec 2019 01:31:15 -0600
To: <meta-arago@arago-project.org>
From: Nikhil Devshatwar <nikhil.nd@ti.com>
Message-ID: <d69f529f-7780-8279-7a4f-d84cfb655ddc@ti.com>
Date: Fri, 6 Dec 2019 13:00:47 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.2.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Adding postinst script with dependencies
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
X-List-Received-Date: Fri, 06 Dec 2019 07:32:49 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hi all,

I was working on a demo package recipe where I want to update files 
being installed by other package.

For this, I went about adding a postinst function

e.g. oob-demo package DEPENDS on weston-conf

I have a postinst function in oob-demo which updates a file 
(/etc/weston.ini) as part of installation

This works fine if I install the oob-demo IPK in the existing target.

However, the yocto build fails when I try to build the tisdk-rootfs-image.

I understood that the postinst functions get called alphabetically, and 
DEPENDS is not respected there.

https://www.yoctoproject.org/pipermail/poky/2012-June/007984.html


Is there any better way to achieve this?


Regards,

Nikhil D



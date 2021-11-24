Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web08.4627.1637791221500143146
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 24 Nov 2021 14:00:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=vbHlzppv;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: praneeth@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1AOM0Gol001242;
	Wed, 24 Nov 2021 16:00:16 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1637791216;
	bh=s44RN/TWb6vUFAgQx98Vhk4xLew+IHXHVxwRAVcoUMw=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=vbHlzppvb5dkZ2R+ShDf+wBR40N4MJ4oaumcR9pFvpBBltsQJnoFDLK3CGuzWUCwE
	 u69brewk/hSp0Bd8w4ErsjrDscA+zL5Jxp0kVgrEhXVzf25WhwF3FuAuVGZPdhegpO
	 yGt/CGawo/ysad3IRLuIMipZr7+mzKFoKahk/CuI=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1AOM0G6k125565
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 24 Nov 2021 16:00:16 -0600
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 24
 Nov 2021 16:00:16 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Wed, 24 Nov 2021 16:00:16 -0600
Received: from [10.247.25.23] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1AOM0GW8077877;
	Wed, 24 Nov 2021 16:00:16 -0600
Message-ID: <6cf5a3d2-d10c-6ffd-6001-e04a02a55c54@ti.com>
Date: Wed, 24 Nov 2021 16:00:16 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [meta-arago] [dunfell PATCH 0/2] recipes-graphics: Update weston to fix Matrix GUI
To: Priya N S <priya.ns@mistralsolutions.com>,
        <meta-arago@lists.yoctoproject.org>,
        Denys Dmytriyenko <denis@denix.org>, "Eatmon, Ryan" <reatmon@ti.com>
CC: Sekhar Nori <nsekhar@ti.com>, Priya N S <priya.ns@ti.com>,
        Yogesh Siraswar
	<yogeshs@ti.com>
References: <20211026134145.57608-1-priya.ns@ti.com>
From: "praneeth" <praneeth@ti.com>
In-Reply-To: <20211026134145.57608-1-priya.ns@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Language: en-US
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

+ Denys, Ryan (for the series)

On 10/26/2021 8:41 AM, Priya N S wrote:
> Hi All,
> This series of patches fix the Matrix GUI Issue,
> 
> Issue:
> After the target board is booted, by default the Matrix GUI Demo is
> not getting displayed on the display device connected to the target
> board.
> The root cause of the Matrix GUI demo issue is that there are two
> Weston system services running in the filesystem. Below are the two
> services,
> 1. Weston systemd service
> 2. Weston initscript service
> The Matrix GUI demo runs on top of the Weston service. Since there
> are two Weston services running, it causes the Matrix GUI demo to not
> work properly.
> 
> Fix:
> Both Weston services (systemd and initscript) which has the same command
> and does the same job. So, remove the weston systemd services from the
> filesystem. This fix displays the Matrix GUI in the connected display
> device.
> 
> Priya N S (2):
>    wayland: weston: Disable weston systemd service
>    weston-init: Update initscript for weston-calibration
> 
>   .../recipes-graphics/wayland/weston-init.bbappend            | 5 ++++-
>   meta-arago-distro/recipes-graphics/wayland/weston-init/init  | 2 +-
>   2 files changed, 5 insertions(+), 2 deletions(-)
> 

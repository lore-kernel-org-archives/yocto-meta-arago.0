Return-Path: <r-gunasekaran@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D508DC4828F
	for <webhook@archiver.kernel.org>; Fri,  9 Feb 2024 10:36:35 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.8705.1707474986080332987
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 09 Feb 2024 02:36:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=f/O0B5KP;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: r-gunasekaran@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 419AaNAE018255;
	Fri, 9 Feb 2024 04:36:23 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1707474983;
	bh=9Xg7HxT0CtELnVn+XDCowM23F2vYe3nl/CxCOpqug6M=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=f/O0B5KPEmWfuKpp+m1Q6l8OBFci9GJnEk7UcfoysJAup9iIBsXaDqvZ0jEa03mtP
	 MerYB1nWBoOcOxcGWn+cP9fyhgJrZ5+KZ+xxW+oiZfMOmhTtE2NAnS+RVV03FTcboS
	 hXXmdEpYiRb4XWYPEP1c+5pEfuQnZCX2BCi7rH8c=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 419AaNlo011504
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 9 Feb 2024 04:36:23 -0600
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 9
 Feb 2024 04:36:23 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 9 Feb 2024 04:36:23 -0600
Received: from [172.24.227.88] (uda0500640.dhcp.ti.com [172.24.227.88])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 419AaKIf027190;
	Fri, 9 Feb 2024 04:36:21 -0600
Message-ID: <cb896c22-be29-3b93-7f7b-043c180ea8be@ti.com>
Date: Fri, 9 Feb 2024 16:06:20 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [master/kirkstone][PATCH] meta-arago-extras: sysrepo: Update
 netopeer and sysrepo to start under systemd
To: <meta-arago@lists.yoctoproject.org>
CC: <denis@denix.org>, <reatmon@ti.com>, <g-gupta@ti.com>, <praneeth@ti.com>,
        <srk@ti.com>, Ravi Gunasekaran <r-gunasekaran@ti.com>
References: <20240209103337.25332-1-r-gunasekaran@ti.com>
Content-Language: en-US
From: Ravi Gunasekaran <r-gunasekaran@ti.com>
In-Reply-To: <20240209103337.25332-1-r-gunasekaran@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 09 Feb 2024 10:36:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15149



On 2/9/24 4:03 PM, Ravi Gunasekaran wrote:
> The init.d scripts for sysrepo and netopeer2-server requires certain
> other init.d scripts that are now removed. And the systemd services generated
> systemd-sysv-generator is not sufficient.
> 
> So introduce new unit files for sysrepo and netopeer2 and update the
> respective bitbake recipes.
> 
> Signed-off-by: Ravi Gunasekaran <r-gunasekaran@ti.com>
> ---
>  .../netopeer2-serverd.service                 | 29 +++++++++++++++
>  .../netopeer2-server/netopeer2-server_git.bb  | 20 +++++++++-
>  .../sysrepo/sysrepo/sysrepod.service          | 37 +++++++++++++++++++
>  .../recipes-sysrepo/sysrepo/sysrepo_git.bb    | 23 ++++++++++--
>  4 files changed, 104 insertions(+), 5 deletions(-)
>  create mode 100644 meta-arago-extras/recipes-sysrepo/netopeer2-server/netopeer2-server/netopeer2-serverd.service
>  create mode 100644 meta-arago-extras/recipes-sysrepo/sysrepo/sysrepo/sysrepod.service
> 


systemd service status at boot-up and after starting sservices


/* sysrepo and netopeer2-server disabled at bootup */

root@am62pxx-evm:~# systemctl status sysrepod.service
* sysrepod.service - Sysrepo
     Loaded: loaded (8;;file://am62pxx-evm/lib/systemd/system/sysrepod.service/lib/systemd/system/sysrepod.service8;;; disabled; vendor preset: disabled)8;;
     Active: inactive (dead)
root@am62pxx-evm:~# 
root@am62pxx-evm:~# systemctl status netopeer2-serverd.service
* netopeer2-serverd.service - Netopeer2-Server
     Loaded: loaded (8;;file://am62pxx-evm/lib/systemd/system/netopeer2-serverd.service/lib/systemd/system/netopeer2-serverd.service8;;; disabled; vendor preset: disabled)8;;
     Active: inactive (dead)


root@am62pxx-evm:~# 
root@am62pxx-evm:~# 
root@am62pxx-evm:~# systemctl start sysrepod.service                                                                                                                                                               
root@am62pxx-evm:~# 
root@am62pxx-evm:~# systemctl status sysrepod.service                                                                                                                                                              
* sysrepod.service - Sysrepo
     Loaded: loaded (8;;file://am62pxx-evm/lib/systemd/system/sysrepod.service/lib/systemd/system/sysrepod.service8;;; disabled; vendor preset: disabled)8;;
     Active: active (exited) since Thu 1970-01-01 00:00:56 UTC; 5s ago
    Process: 1097 ExecStartPre=/bin/bash -c NP2_MODULE_DIR="/usr/share/yang/modules/netopeer2"                             NP2_MODULE_PERMS="600" NP2_MODULE_OWNER="root"                          NP2_MODULE_GROU>
    Process: 1342 ExecStartPre=/bin/bash /etc/netopeer2/scripts/merge_hostkey.sh (code=exited, status=0/SUCCESS)
    Process: 1365 ExecStartPre=/bin/bash /etc/netopeer2/scripts/merge_config.sh (code=exited, status=0/SUCCESS)
    Process: 1373 ExecStartPre=touch /etc/sysrepo/init (code=exited, status=0/SUCCESS)
    Process: 1374 ExecStart=/usr/bin/sysrepo-plugind (code=exited, status=0/SUCCESS)
   Main PID: 1374 (code=exited, status=0/SUCCESS)
      Tasks: 3 (limit: 8760)
     Memory: 6.7M
     CGroup: /system.slice/sysrepod.service
             `- 1375 /usr/bin/sysrepo-plugind

Jan 01 00:00:51 am62pxx-evm systemd[1]: Starting Sysrepo...
Jan 01 00:00:56 am62pxx-evm systemd[1]: Finished Sysrepo.
root@am62pxx-evm:~# 

root@am62pxx-evm:~# systemctl start netopeer2-serverd.service
root@am62pxx-evm:~# 
root@am62pxx-evm:~# systemctl status netopeer2-serverd.service                                                                                                                                                     
* netopeer2-serverd.service - Netopeer2-Server
     Loaded: loaded (8;;file://am62pxx-evm/lib/systemd/system/netopeer2-serverd.service/lib/systemd/system/netopeer2-serverd.service8;;; disabled; vendor preset: disabled)8;;
     Active: active (exited) since Thu 1970-01-01 00:01:15 UTC; 5s ago
    Process: 1382 ExecStart=/usr/sbin/netopeer2-server -v 1 (code=exited, status=0/SUCCESS)
   Main PID: 1382 (code=exited, status=0/SUCCESS)
      Tasks: 6 (limit: 8760)
     Memory: 5.6M
     CGroup: /system.slice/netopeer2-serverd.service
             `- 1383 /usr/sbin/netopeer2-server -v 1

Jan 01 00:01:15 am62pxx-evm systemd[1]: Starting Netopeer2-Server...
Jan 01 00:01:15 am62pxx-evm systemd[1]: Finished Netopeer2-Server.

-- 
Regards,
Ravi


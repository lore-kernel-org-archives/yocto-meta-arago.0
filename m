Received: from egress-ip33b.ess.de.barracuda.com (egress-ip33b.ess.de.barracuda.com [18.185.115.237])
 by mx.groups.io with SMTP id smtpd.web09.9018.1634822180656582212
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 21 Oct 2021 06:16:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mistralsolutions.com header.s=google header.b=S6q1K2m0;
 spf=pass (domain: mistralsolutions.com, ip: 18.185.115.237, mailfrom: sinthu.raja@mistralsolutions.com)
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200]) by mx-outbound21-85.eu-central-1b.ess.aws.cudaops.com (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO); Thu, 21 Oct 2021 13:16:15 +0000
Received: by mail-pl1-f200.google.com with SMTP id x5-20020a1709028ec500b0013a347b89e4so194085plo.3
        for <meta-arago@lists.yoctoproject.org>; Thu, 21 Oct 2021 06:16:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mistralsolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qyOAZYX9+eRRdoYmWgH6Xizkim2lKSVHXTcF4J6h4xg=;
        b=S6q1K2m0p0Oa3KqlK1kILxFE23W1E4n0d1t94zMJmQ0oEDYD7eIJyl4OmURwma91bh
         nLE/7GI0w8daaDVcM7k2xMtQ5yTTjw8dGMyyL2Lcot6dQDPbY2/rHpOvRT81jB6PZQN5
         EQ2FVZmtmgODO+PGe8WkbdMAOGc+pJ56CM6bQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qyOAZYX9+eRRdoYmWgH6Xizkim2lKSVHXTcF4J6h4xg=;
        b=mHhNTZNYigb20KuTFfKpmgPX5nyxq/nm7WlGffcPpSU0vA8SbxWJFk8e5/LZYIDVVi
         NmLMFdZP6q/FgZzrIPohqipZ0NULYauGv6gcGNNK7vk92UzSliEeQN8iZv3xA+kbDMMC
         lEd/cBwuuHBOR9toSrmEBoev+mIIG60PWj60VrmYGd9ruLST8mT5mtHT/blitGOdVVNS
         u/h9XWxdC089+v6S07hM8cPaTInny939JFje0aXuWdoQ4booNhbepjbdZPRAPiFFGL6K
         kvJrzK+E7demy043cInwsyzIpF20UFkGNKPWqCEib/NDjLAe8i/a4/mVZEu5kmlThSwm
         SsXQ==
X-Gm-Message-State: AOAM5339pchdM/6qJHLDlFibOrzzfB78/WvL29ZgkTB3aejvQTX4VC7j
	KBij5fg4vOhMajPH/3xJkftTj//JcH8pGt+caXd7gCNsA79Jd5Dsroc0R4jziTgTNLh0CESECtn
	kd+akWd255PSUhRbhp3RknMEpQ5Lvox4Hgzbwx3W4lDDTQkekibR83FCVDiCglDbNYEs=
X-Received: by 2002:a63:7355:: with SMTP id d21mr4341420pgn.179.1634822174118;
        Thu, 21 Oct 2021 06:16:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyVJm7qQxXj6Oeck89oi42V2aiNsth+hoFB2gKYE6i9YWkXsaNlf1apP5IRd1cY+RFAoLc39A==
X-Received: by 2002:a63:7355:: with SMTP id d21mr4341397pgn.179.1634822173734;
        Thu, 21 Oct 2021 06:16:13 -0700 (PDT)
Return-Path: <sinthu.raja@mistralsolutions.com>
Received: from LAP568U.mistral.in ([106.51.227.150])
        by smtp.gmail.com with ESMTPSA id i12sm6028374pfo.126.2021.10.21.06.16.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Oct 2021 06:16:13 -0700 (PDT)
From: Sinthu Raja <sinthu.raja@mistralsolutions.com>
X-Google-Original-From: Sinthu Raja <sinthu.raja@ti.com>
To: meta-arago@lists.yoctoproject.org
Cc: Nikhil Devshatwar <nikhil.nd@ti.com>,
	Praneeth Bajjuri <praneeth@ti.com>,
	Denys Dmytriyenko <denis@denix.org>,
	Sinthu Raja <sinthu.raja@ti.com>
Subject: [meta-arago][dunfell/master][PATCH V4 0/2] Package intel 9260 WiFi and BT firmware
Date: Thu, 21 Oct 2021 18:45:57 +0530
Message-Id: <20211021131559.16817-1-sinthu.raja@ti.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-BESS-ID: 1634822174-305461-5454-13316-1
X-BESS-VER: 2019.1_20211019.2112
X-BESS-Apparent-Source-IP: 209.85.214.200
X-BESS-Outbound-Spam-Score: 0.50
X-BESS-Outbound-Spam-Report: Code version 3.2, rules version 3.2.2.235307 [from 
	cloudscan16-60.eu-central-1b.ess.aws.cudaops.com]
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------
	0.10 BSF_SC0_SA085          META: Custom Rule SA085 
	0.00 BSF_BESS_OUTBOUND      META: BESS Outbound 
	0.40 BSF_SC0_SA085b         META: Custom Rule SA085b 
X-BESS-Outbound-Spam-Status: SCORE=0.50 using account:ESS91090 scores of KILL_LEVEL=7.0 tests=BSF_SC0_SA085, BSF_BESS_OUTBOUND, BSF_SC0_SA085b
X-BESS-BRTS-Status: 1
Content-Transfer-Encoding: 8bit

From: Sinthu Raja <sinthu.raja@ti.com>

Hi,
This patch series adds support to package the intel 9260 linux firmware
into the J7 EVM SDK. The firmware is already available in the linux firmware
repository, so updated the linux-firmware recipe to packaging the firmware.

Changes in V4:
* Addressed review comments that include making changes that are consistent with 
respect to the original recipe.

V3: http://arago-project.org/pipermail/meta-arago/2021-October/013350.html
V2: https://www.mail-archive.com/meta-arago@arago-project.org/msg12120.html
V1: https://www.mail-archive.com/meta-arago@arago-project.org/msg12116.html

Sinthu Raja (2):
  linux-firmware: Package intel 9260 WiFi and BT firmware
  packagegroups: tisdk-connectivity: package intel-9260 linux firmware
    images

 .../packagegroup-arago-tisdk-connectivity.bb       |  4 +++-
 .../linux-firmware/linux-firmware_%.bbappend       | 14 +++++++++++++-
 2 files changed, 16 insertions(+), 2 deletions(-)

-- 
2.31.1


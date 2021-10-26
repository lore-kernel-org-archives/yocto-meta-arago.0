Received: from egress-ip33b.ess.de.barracuda.com (egress-ip33b.ess.de.barracuda.com [18.185.115.237])
 by mx.groups.io with SMTP id smtpd.web12.12296.1635255731822489664
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 26 Oct 2021 06:42:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mistralsolutions.com header.s=google header.b=EaBw3Kji;
 spf=pass (domain: mistralsolutions.com, ip: 18.185.115.237, mailfrom: priya.ns@mistralsolutions.com)
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198]) by mx-outbound23-90.eu-central-1b.ess.aws.cudaops.com (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO); Tue, 26 Oct 2021 13:42:07 +0000
Received: by mail-pl1-f198.google.com with SMTP id m10-20020a1709026bca00b0013f8e975b31so4961893plt.5
        for <meta-arago@lists.yoctoproject.org>; Tue, 26 Oct 2021 06:42:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mistralsolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6btz3AzH49JVDJyj0C5DdjYlY6YmECgwl3GuNYft+E8=;
        b=EaBw3KjiAHH7paTtUAtWOf+ggcTvGnK4L9QMgji9u8iEVyDCTiqccihLOTwM8rKMzp
         hRNSPa54Nq9NHiNcsJH5WTxMq98x/JXdMcGtG3SADQhWXPDSZfZvGTpozjKPs5STn9Aj
         mijZADlO/oKe034wIw2BVYclsX9WfXh0lQ4Sw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6btz3AzH49JVDJyj0C5DdjYlY6YmECgwl3GuNYft+E8=;
        b=AwyjmmMY1eFfwSaSfSycbqXspznTcwyvtxy4uu8a3/KF2D5iqjg4ecRpQ1w2mi+ufe
         Iydkf/6hobDC2n3teCDxcq21Q+J5Dc8T2NEY8z+pYTKC3UEW5iSJllVU5tCbpgdAZf7K
         TTGDRmwgxVLbbZd9qk9lDlVMvKK0cuHc11wVq8mliHaLBLdp40fXMwoThi2ZGmCUVkhE
         lTQJTrQkR6CA8GEudDO/7XsZmnKrlcWWJTPd5o1rZuhkzS+1pSsacuEh31jjJHI9eQLZ
         PUmKqE/mAfrzqBWVSY3bX+vbsrAZV6qUr03DA/kt9lS9QvsRkttRf/c2abxWJTADtAhw
         8NHQ==
X-Gm-Message-State: AOAM530FINoJAzcrIeRCfcJJMEe2Z+wpgfFatBC3qA8uisoJTN6g3HRR
	HX0AkmOQAv4q1V2IiJqh3TBV28pFwnjkf7UTlYMhVhg9xiE6MKlgb+ual+Kv5YQ80JkDzC3Q5CS
	VAliz9yFRbW8d0TdnM7MxKVIO9tvkUr2H/3Lp6HYdczbbGg6w+HaEefE1WAeh+dY/h6k=
X-Received: by 2002:a17:903:11cc:b0:13f:ecf7:22c7 with SMTP id q12-20020a17090311cc00b0013fecf722c7mr22232886plh.5.1635255725430;
        Tue, 26 Oct 2021 06:42:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxLpi6V5dzPv/2JWott66bUlmImMg+WfZ4fU+kUmV4mh7x2wdbmT2QltNX/O54Y/YRxzR2Rxg==
X-Received: by 2002:a17:903:11cc:b0:13f:ecf7:22c7 with SMTP id q12-20020a17090311cc00b0013fecf722c7mr22232849plh.5.1635255725031;
        Tue, 26 Oct 2021 06:42:05 -0700 (PDT)
Return-Path: <priya.ns@mistralsolutions.com>
Received: from LAP000507.mistral.in ([106.51.227.150])
        by smtp.gmail.com with ESMTPSA id k1sm867050pjj.54.2021.10.26.06.42.02
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 26 Oct 2021 06:42:04 -0700 (PDT)
From: "Priya N S" <priya.ns@mistralsolutions.com>
X-Google-Original-From: Priya N S <priya.ns@ti.com>
To: meta-arago@lists.yoctoproject.org
Cc: Praneeth Bajjuri <praneeth@ti.com>,
	Sekhar Nori <nsekhar@ti.com>,
	Priya N S <priya.ns@ti.com>
Subject: [meta-arago] [dunfell PATCH 0/2] recipes-graphics: Update weston to fix Matrix GUI
Date: Tue, 26 Oct 2021 19:11:43 +0530
Message-Id: <20211026134145.57608-1-priya.ns@ti.com>
X-Mailer: git-send-email 2.19.1.windows.1
MIME-Version: 1.0
X-BESS-ID: 1635255726-305978-5435-13224-1
X-BESS-VER: 2019.1_20211021.1606
X-BESS-Apparent-Source-IP: 209.85.214.198
X-BESS-Outbound-Spam-Score: 0.00
X-BESS-Outbound-Spam-Report: Code version 3.2, rules version 3.2.2.235420 [from 
	cloudscan21-220.eu-central-1b.ess.aws.cudaops.com]
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------
	0.00 BSF_BESS_OUTBOUND      META: BESS Outbound 
X-BESS-Outbound-Spam-Status: SCORE=0.00 using account:ESS91090 scores of KILL_LEVEL=7.0 tests=BSF_BESS_OUTBOUND
X-BESS-BRTS-Status: 1
Content-Transfer-Encoding: 8bit

Hi All,
This series of patches fix the Matrix GUI Issue,

Issue:
After the target board is booted, by default the Matrix GUI Demo is
not getting displayed on the display device connected to the target
board.
The root cause of the Matrix GUI demo issue is that there are two
Weston system services running in the filesystem. Below are the two
services,
1. Weston systemd service
2. Weston initscript service
The Matrix GUI demo runs on top of the Weston service. Since there
are two Weston services running, it causes the Matrix GUI demo to not
work properly.

Fix:
Both Weston services (systemd and initscript) which has the same command 
and does the same job. So, remove the weston systemd services from the
filesystem. This fix displays the Matrix GUI in the connected display
device.

Priya N S (2):
  wayland: weston: Disable weston systemd service
  weston-init: Update initscript for weston-calibration

 .../recipes-graphics/wayland/weston-init.bbappend            | 5 ++++-
 meta-arago-distro/recipes-graphics/wayland/weston-init/init  | 2 +-
 2 files changed, 5 insertions(+), 2 deletions(-)

-- 
2.19.1.windows.1


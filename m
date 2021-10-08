Return-Path: <sinthu.raja@mistralsolutions.com>
Received: from egress-ip4b.ess.de.barracuda.com
	(egress-ip4b.ess.de.barracuda.com [18.185.115.208])
	by arago-project.org (Postfix) with ESMTPS id AD64D52C3B
	for <meta-arago@arago-project.org>;
	Fri,  8 Oct 2021 08:06:24 +0000 (UTC)
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
	[209.85.215.200]) by
	mx-outbound46-181.eu-central-1c.ess.aws.cudaops.com
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Fri, 08 Oct 2021 08:06:54 +0000
Received: by mail-pg1-f200.google.com with SMTP id
	u5-20020a63d3450000b029023a5f6e6f9bso1176201pgi.21
	for <meta-arago@arago-project.org>;
	Fri, 08 Oct 2021 01:06:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mistralsolutions.com; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Ry0aQvx+TuR2ONc+HAT40BX4JQ6ynqS2BoC9/InHj4U=;
	b=RJiCuus7PFj0iCuzJ1lFtx1NgI2BcNJbyosHtF6xCBnz3Gn98GFsqEpZRsb3cK4wj0
	YGIjiD89bTAjOWt6DdEwBuEQQzpkz/qk/ihEXoStQZSui6gYL7P+VvGFqwsvRF/tazvP
	5KmJ5g+4jrIOoEsjj6X7vYahr8iWD6QnpYwLk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Ry0aQvx+TuR2ONc+HAT40BX4JQ6ynqS2BoC9/InHj4U=;
	b=N3hYF1EHrNL6ukq2HKhxEKiw5uOcMwBmMgKFTNJi+WFikD6/Qa0j7DAO1NM2H0w9dd
	9n0MsHrpC5nkRHNcI9IY2LdXT81BVlI+vEAc/1Dnp9g4PEatrFDkjcpGJXLcrz2q2d8x
	qQgMkHahPH6XxOALg4MAs740WYFu9M1nPgoCp4LW3vT0N8LiRYqCJ/VI29hiProfB+Bf
	/kymKYNfIrxPqUnCZ7roddDbiE03wJRL3xR9hnYQIXfzqdwlSEyxfnY5VUS1fQYRSI4r
	5Plv+nb8/Rvc+yXgKy6FVZ1S/KTrLdzr17EwfO+AAHNEulxwB6EBEVDcdo3y2F5gOgwZ
	9yPA==
X-Gm-Message-State: AOAM532r1Rm5KQl30bYT7pMiCL96ntNj+TnKavh5k14S1t9IhqCJN3UO
	F268ioNA1EHPCQkv9ZZyUhgOxtsm6Y/5Nz4I+OYRGa8rXbYMs6rrjA7gd4GR6a/U7Ns4bplUyyd
	Yh36beR6M/YBTOaG+F/uSuf/i50mut/BG/g3BBmkskLxWXwgQyP7Sua/jjR8e
X-Received: by 2002:a63:7402:: with SMTP id p2mr3468082pgc.472.1633680412587; 
	Fri, 08 Oct 2021 01:06:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzWdqqRx10O1qRUfEjCmc/Rfujo7dMjfMHHko3ipOfzA44T4Uaq14WekHN2FnkBCGnh72ZQ5w==
X-Received: by 2002:a63:7402:: with SMTP id p2mr3468064pgc.472.1633680412262; 
	Fri, 08 Oct 2021 01:06:52 -0700 (PDT)
Received: from LAP568U.mistral.in ([106.51.227.150])
	by smtp.gmail.com with ESMTPSA id t2sm10393328pjf.1.2021.10.08.01.06.49
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 08 Oct 2021 01:06:51 -0700 (PDT)
From: Sinthu Raja <sinthu.raja@mistralsolutions.com>
X-Google-Original-From: Sinthu Raja <sinthu.raja@ti.com>
To: meta-arago@arago-project.org
Date: Fri,  8 Oct 2021 13:36:30 +0530
Message-Id: <20211008080632.22629-1-sinthu.raja@ti.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-BESS-ID: 1633680413-311957-5453-2603-1
X-BESS-VER: 2019.1_20211006.2200
X-BESS-Apparent-Source-IP: 209.85.215.200
X-BESS-Outbound-Spam-Score: 0.40
X-BESS-Outbound-Spam-Report: Code version 3.2,
	rules version 3.2.2.235005 [from 
	cloudscan9-102.eu-central-1a.ess.aws.cudaops.com]
	Rule breakdown below
	pts rule name              description
	---- ---------------------- --------------------------------
	0.00 BSF_BESS_OUTBOUND      META: BESS Outbound 
	0.40 BSF_SC0_SA085b         META: Custom Rule SA085b 
X-BESS-Outbound-Spam-Status: SCORE=0.40 using account:ESS91090 scores of
	KILL_LEVEL=7.0 tests=BSF_BESS_OUTBOUND, BSF_SC0_SA085b
X-BESS-BRTS-Status: 1
Cc: Sinthu Raja <sinthu.raja@ti.com>
Subject: [dunfell/master][PATCH V2 0/2] Package intel 9260 WiFi and BT firmware
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
X-List-Received-Date: Fri, 08 Oct 2021 08:06:25 -0000
Content-Transfer-Encoding: 8bit

From: Sinthu Raja <sinthu.raja@ti.com>

Hi,
This patch series adds support to package the intel 9260 linux firmware
into the J7 EVM SDK. The firmware is already available in the linux firmware
repository, so updated the linux-firmware recipe to packaging the firmware.

Changes in V2:
Addressed review comments that includes
* update the commit messsage
* removed machine specific changes and made it generic.

V1: https://serenity.dal.design.ti.com/patchwork/project/meta-arago/patch/20211007140939.19819-1-sinthu.raja@ti.com/


Sinthu Raja (2):
  packagegroups: tisdk-connectivity: package intel-9260 linux firmware
    images
  linux-firmware: Package intel 9260 WiFi and BT firmware

 .../packagegroup-arago-tisdk-connectivity.bb       |  4 +++-
 .../linux-firmware/linux-firmware_%.bbappend       | 14 +++++++++++++-
 2 files changed, 16 insertions(+), 2 deletions(-)

-- 
2.31.1



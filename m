Return-Path: <priya.ns@mistralsolutions.com>
Received: from egress-ip4b.ess.de.barracuda.com
	(egress-ip4b.ess.de.barracuda.com [18.185.115.208])
	by arago-project.org (Postfix) with ESMTPS id 36CF752B6B
	for <meta-arago@arago-project.org>;
	Tue, 22 Jun 2021 13:44:48 +0000 (UTC)
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
	[209.85.215.199]) by
	mx-outbound20-118.eu-central-1b.ess.aws.cudaops.com
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Tue, 22 Jun 2021 13:45:34 +0000
Received: by mail-pg1-f199.google.com with SMTP id
	i8-20020a633c480000b0290223167334a7so8802383pgn.19
	for <meta-arago@arago-project.org>;
	Tue, 22 Jun 2021 06:45:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mistralsolutions.com; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=lM/ftu2k//GgmN/SB70JNz09qTUAmIzN/YwptORk1+g=;
	b=eMd2Hbd1hQkeIv2n4F6bfZhKyihXdrPr2dz6aOBiy1slh7saefmShPAC3zKXBG7ZS0
	opwgN+6Z8Hs9mUtGNYLuCgRzoA16mq3rPojiuy5qlZLtgcFT7Sw/U0gciALVCbd+AKNE
	QSreS2+XBdNJW+7SujZ5ieANO5X4ch3DPliIk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=lM/ftu2k//GgmN/SB70JNz09qTUAmIzN/YwptORk1+g=;
	b=Z6lLhV4fdHvEhd6IG8lIggCQZFVoOIMRhhd0FQUTE5Wl2XIPNfmEANxYRJ7UFuNGKj
	YwAcWDqeMIhisLzyvGJ/L6UjCS2Besf7Sjt5+f+IyzgKJ7Bxg8A5RL4ZIIbX4+YE8lXY
	JNeCBD5ElrD2VZltk3E+/IhULlOS/C3t0cIbLPpR7BSzQiR/opTruN7CPZVV3RMzcJJ5
	ITmNkRCX7RRkNugcLBxWIipbEKYzgT971gW60bItfe+Cs7B3DwxnpGj9r2A4ogcZq7N8
	L7C8ZsVywefuK8+QQ/wlyI+FDTWfEynstLypkTmbb1QxMxKfSykkiPcOcBqZQp5M3RAh
	YQgg==
X-Gm-Message-State: AOAM530/8OKEM7bCqBe0gtLknhA+aNtslgWV2Olx+vIUzllf4zE9dkGl
	CkgpirFTQDvtUXABE0Sv7umGDcyJF9ZdjMHsDIPzHAKlxxFCb2i262KiizKaHf4vtc6sK+/clQN
	WUNpZxdhapWIcXI4PbR6oaqhxnvUViO+dgzpfIHuky8J87AERvotSCGbVLpP/
X-Received: by 2002:a63:c1e:: with SMTP id b30mr3936058pgl.118.1624369532618; 
	Tue, 22 Jun 2021 06:45:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJygQqaUIISYfGdBHk1uvo35lNOBHRg4v+TlXx/2PArrEHPUfEMZxuA84rXRiHaMhKXEeNO58g==
X-Received: by 2002:a63:c1e:: with SMTP id b30mr3936038pgl.118.1624369532380; 
	Tue, 22 Jun 2021 06:45:32 -0700 (PDT)
Received: from LAP000507.mistral.in ([157.49.90.247])
	by smtp.gmail.com with ESMTPSA id
	n23sm19132178pff.93.2021.06.22.06.45.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 22 Jun 2021 06:45:32 -0700 (PDT)
From: Priya N S <priya.ns@mistralsolutions.com>
To: meta-arago@arago-project.org
Date: Tue, 22 Jun 2021 19:14:57 +0530
Message-Id: <20210622134500.87848-1-priya.ns@mistralsolutions.com>
X-Mailer: git-send-email 2.19.1.windows.1
MIME-Version: 1.0
X-BESS-ID: 1624369533-305238-7613-138115-1
X-BESS-VER: 2019.1_20210618.2139
X-BESS-Apparent-Source-IP: 209.85.215.199
X-BESS-Outbound-Spam-Score: 0.00
X-BESS-Outbound-Spam-Report: Code version 3.2,
	rules version 3.2.2.233105 [from 
	cloudscan9-222.eu-central-1a.ess.aws.cudaops.com]
	Rule breakdown below
	pts rule name              description
	---- ---------------------- --------------------------------
	0.00 BSF_BESS_OUTBOUND      META: BESS Outbound 
X-BESS-Outbound-Spam-Status: SCORE=0.00 using account:ESS91090 scores of
	KILL_LEVEL=7.0 tests=BSF_BESS_OUTBOUND
X-BESS-BRTS-Status: 1
Cc: Sekhar Nori <nsekhar@ti.com>
Subject: [tisdk-setup-scripts] [master] [PATCH-V2 0/3] create-sdcard: Fix rootfs tarball search and selection
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
X-List-Received-Date: Tue, 22 Jun 2021 13:44:48 -0000
Content-Transfer-Encoding: 8bit

From: Priya N S <priya.ns@ti.com>

Hi All,
Changes from previous version:
1. Added the repo name in the subject.

Priya N S (3):
  create-sdcard.sh: fix regex used for rootfs tarball
  create-sdcard: Fix wrong rootfs tarball selection
  create-sdcard.sh: Stop using cylinder as unit for partition size

 create-sdcard.sh | 75 +++++++++++++++++++++++++++++++++++++-----------
 1 file changed, 58 insertions(+), 17 deletions(-)

-- 
2.19.1.windows.1



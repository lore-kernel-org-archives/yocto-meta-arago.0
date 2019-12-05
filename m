Return-Path: <hnagalla@gmail.com>
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com
	[209.85.210.44])
	by arago-project.org (Postfix) with ESMTPS id 97D75529E5
	for <meta-arago@arago-project.org>;
	Thu,  5 Dec 2019 19:18:28 +0000 (UTC)
Received: by mail-ot1-f44.google.com with SMTP id i15so3603427oto.7
	for <meta-arago@arago-project.org>;
	Thu, 05 Dec 2019 11:16:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=be1fYcu5t8u9R5qL3MhiwkUbdwduSibZ75iEh3V+tM8=;
	b=sl1HX7mRW2K6hDFFjsIDEL3X6VY7IiZooL1/1WmSiISk5b+lxKR8i6uYd50A+fr+re
	L4TTEYwPrYZYGYPL/Pyai2QYRfzIbNMBBVPDpb0joWBKtqF8SNaVnLrY90hI+xyCXbh/
	A9qjuiUVXJe+oPXcHjlnog6lWP3vMHjKazFm+VK3sN083kzzsU2OwaLalznwcKNq1EY5
	8GyFr5P/EVzyXKIBh1pEBmLmdE3zDW5gi2JTmIF7Qylc4+0CzVHpgCtJqScHLXEJUv2w
	ZGO4R8MN11XvaSmRJS7fgIHsY9h8n0pSi/b1+L9gjdz8Q+VnLEgskjI5tPzIemNydrvE
	UCXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=be1fYcu5t8u9R5qL3MhiwkUbdwduSibZ75iEh3V+tM8=;
	b=bXrPJH5uOeg3HI5lZR9+ftx9GAXjBq5vW0XMntnE1OMA5bBA0ocyM1kVL78xChzJlg
	cg6OZ+tgaY8bqRups6vaqJJlBBVriM4DQRYO0NJPFuemkoNNEM2IWcSmfatq9FouG827
	CuCByadd3oyAIznQ9mEfNz/1bPys9apEaYaJtxpPQjGPTn6EOV3LibV5rH6KJSGPygwa
	3cTvgEeI9RNzsSjmRBtskJoEf1tAkMn/qKHPsUuw5fhs0sWut/IafTEuFPs1kqj+hl/6
	btuyNNDPv8DWcn4jPkszxM1Mr6B9qPtAomombQszuxBqd/mw9VjzGwBdRQWEqg/o8U9R
	7dVA==
X-Gm-Message-State: APjAAAVjY7uyVKeuo+LUP1VwveYXu5nDdgG0vVi6KcZVHyTs/fuR+wwg
	1rutx72aPR7JCI0uCR+AOuVSlUoc7l0=
X-Google-Smtp-Source: APXvYqwE3ZY5BOThf3ETk2DcJLJRqhKTVA92MkhM4ZkCYq8EEEnZj/v6F+xZQbgi7AT2Tq4w2OMbRw==
X-Received: by 2002:a05:6830:1116:: with SMTP id
	w22mr8039948otq.63.1575573415486; 
	Thu, 05 Dec 2019 11:16:55 -0800 (PST)
Received: from hari-Latitude-E6430.utdallas.edu
	(cpe-76-184-237-208.tx.res.rr.com. [76.184.237.208])
	by smtp.gmail.com with ESMTPSA id
	t19sm1792758otr.33.2019.12.05.11.16.53
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 05 Dec 2019 11:16:54 -0800 (PST)
From: Hari Nagalla <hnagalla@gmail.com>
To: meta-arago@arago-project.org
Date: Thu,  5 Dec 2019 13:16:34 -0600
Message-Id: <20191205191635.7598-1-hnagalla@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [ 0/1] *** use wireless-regdb-static ***
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
X-List-Received-Date: Thu, 05 Dec 2019 19:18:28 -0000

*** BLURB HERE ***

Hari Nagalla (1):
  use wireless-regdb-static for > K4.15 kernels

 .../packagegroups/packagegroup-arago-tisdk-connectivity.bb     | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

-- 
2.17.1



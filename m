Return-Path: <ankur.tyagi85@gmail.com>
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
	[209.85.167.53])
	by arago-project.org (Postfix) with ESMTPS id 9253052994
	for <meta-arago@arago-project.org>;
	Sun,  9 Jun 2019 20:15:13 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id m15so5149793lfh.4
	for <meta-arago@arago-project.org>;
	Sun, 09 Jun 2019 13:14:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=GQCXH0cr21rlheqwygzrGazW4AOcxse7N8Ysu0dLtLQ=;
	b=pjJYqulEQimFNcHcN/fHJ7CAGi5Wc1/pKgZ7oS3MVM7DXflJ3k+aHZB/UR1HHsAVyx
	2XPZRqSjTj+XXKlQiFXF0IpbJtyCgl1TPPPUPaaECXZDjVXx4myYGpbzh/MfQBNFvNfO
	5Rtgiv6OPgo106qU8Phif4L6T4wz+6pKrQwRcJBe4zXoNBF+l2u6PCcFwvFmJORL5oum
	LJubNJ0soht21uuU9Evy1h7AHLIkrxdcVx0gPhFy5vTf4FM+XJOd9h0ggZkBjaHqc5AC
	TBQE2jV3doaOuP1hk4kVwGAXMVV2tI/hpKePLclD9gRtYx1wItUFSGtkd15tYJWh8q7L
	52Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=GQCXH0cr21rlheqwygzrGazW4AOcxse7N8Ysu0dLtLQ=;
	b=BRNzwdlvovz3NG3fRdB+IDCrR03XIO/njAO9X7z+JmTtGNyDOxwzOWCLDbWjUJgych
	2gf/3mx+Y9OTcyVQQv1XQMY5CcFMgMevLLPFxUY21xmKelESk+FqvGsxwfRv85SnBoZs
	SyAQPxyLaGMTIW+nDsfgS/hcDw7RuosTI8QDH/z4u6LAb2OHMIzLpPDaboFlilNiB9HR
	KYcCc3RAbQE53Gj/1EHLfto8inunJ5qQ/G+YM6u+hszJmm7j5QU80/PM858leZ4h40LP
	2S9baJo/AsnzkQHr4lVFXkzet/nw8nv7dAWjJ1Ey5mTyXqPfDk/6LYvJMTs0aNjaYLtV
	uiYA==
X-Gm-Message-State: APjAAAUnh1adNcxmnvzZg5deJ8A4IasAxlbA97osV51ck+tmqgv+DF8W
	wbgz5zCT/lL0ICfF5GMLu55EqBrklKkUKbH4qX2MJQ==
X-Google-Smtp-Source: APXvYqwVpJbRCqQf4YOciCvIspwkFHtnSadFf1lkToiYtuV/oE7kbdA3MCl8fCbedhLtz5RIp81ySrYfLFVtDy5+kW0=
X-Received: by 2002:ac2:41d7:: with SMTP id d23mr29379310lfi.118.1560111273706;
	Sun, 09 Jun 2019 13:14:33 -0700 (PDT)
MIME-Version: 1.0
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Mon, 10 Jun 2019 08:14:21 +1200
Message-ID: <CADySD0Fv+OXf_73cMBEWSr2N0pF4wB=NGESN3987kQ8tLfEUDw@mail.gmail.com>
To: meta-arago@arago-project.org
Subject: Upcoming stable branch
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
X-List-Received-Date: Sun, 09 Jun 2019 20:15:14 -0000
Content-Type: multipart/alternative; boundary="000000000000478b3a058ae9b6f3"

--000000000000478b3a058ae9b6f3
Content-Type: text/plain; charset="UTF-8"

Hi,

We are planning to upgrade arago distro in our product.
At this point, I can only see thud branch in meta-arago whereas warrior is
available in oe-core.

Is there any plan for warrior in meta-arago or is it being skipped?
What is the difference between thud and thud-next?

Thanks
Ankur

--000000000000478b3a058ae9b6f3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hi,<div dir=3D"auto"><br></div><div dir=3D"auto">We are p=
lanning to upgrade arago distro in our product.</div><div dir=3D"auto">At t=
his point, I can only see thud branch in meta-arago whereas warrior is avai=
lable in oe-core.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Is the=
re any plan for warrior in meta-arago or is it being skipped?=C2=A0</div><d=
iv dir=3D"auto">What is the difference between thud and thud-next?</div><di=
v dir=3D"auto"><br></div><div dir=3D"auto">Thanks</div><div dir=3D"auto">An=
kur</div></div>

--000000000000478b3a058ae9b6f3--

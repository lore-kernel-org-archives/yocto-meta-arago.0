Return-Path: <matti.kaasinen@gmail.com>
Received: from mail-qk0-f180.google.com (mail-qk0-f180.google.com
	[209.85.220.180])
	by arago-project.org (Postfix) with ESMTPS id 1D10E5299C
	for <meta-arago@arago-project.org>;
	Fri, 15 Apr 2016 09:57:56 +0000 (UTC)
Received: by mail-qk0-f180.google.com with SMTP id x7so8612564qkd.3
	for <meta-arago@arago-project.org>;
	Fri, 15 Apr 2016 02:57:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to;
	bh=wocstT5l3K+JYkXAhEpWy98Op95s/gOPk2n9aHgFiZk=;
	b=EX0AhLYvUq6zFouHtczkQqcoGwfc72QMrFu8pVwsg5w8J9a/uG6kyMRvQA+2UCDRvP
	SK/skBZ5QXomrFJsRw6pIFCeQoX0BSrfRx6BuG0qf0w9ULAi+jgJAPSwsEfHOVKzmlGg
	83KWbOpMjVan4exMX8JVARXfftG+IpcQ9YzOii5MXoBeG2v7lmCI9rP4wUI6GmCW/Gpa
	A/F0Gj4dnM5SVg29z7JN3bnqKco/Q8iynQHhukrJza2Azom6tIwbYJLBosqjIHKyT0+4
	G37/pge3l5O/53Y4ftPVsqROFN0+HnKEqFJPlBiut76CyuuFPO6VLO0M9yhc2dzsSk/9
	G3vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
	bh=wocstT5l3K+JYkXAhEpWy98Op95s/gOPk2n9aHgFiZk=;
	b=D714Z94rgHTeFekjWtAble7m/XxKZ4MFV7zFA0Q4nl49cZjTnQ5vD6HwIN7CN+ifZB
	HIGWtQXBCkyURpOiDtCVaU7KC+Ajz1FsQukqPEJiWOLfzAvULNYKjbQXWX34R5zQz6oP
	z7Xj31yeaqllItPH3CsgPtEJuAdlwWYhiRqIJveQl7Qcez2qw66qyHMcA7pMd/D8hHdT
	d+TIR39aL9rxvtqVbMEtRVy3mJqq8DQrnK3M6pshIO5pcCu7+6q6jhUSPlHxfM1DvAOA
	0YyVRL/zOUT1yD2dECdsR795HE8CRRA7sFNBt21oaN/h9snonQ8FP/IZxy9z5C2X8ot1
	VCVQ==
X-Gm-Message-State: AOPr4FXXlu9ZkNYSZrLd7gjgaxN+pbmD0fG7WShbdgQhF1BABzj9YFQqGImNIfRVrxpH0t3+jA68XCherz3iaA==
MIME-Version: 1.0
X-Received: by 10.55.77.205 with SMTP id a196mr25036475qkb.94.1460714276255;
	Fri, 15 Apr 2016 02:57:56 -0700 (PDT)
Received: by 10.55.113.66 with HTTP; Fri, 15 Apr 2016 02:57:56 -0700 (PDT)
Date: Fri, 15 Apr 2016 12:57:56 +0300
Message-ID: <CADnUhn17zUFiAqUG5eFPibou2apR7r4LgqJqXDTvO7=pZ52K+g@mail.gmail.com>
From: matti kaasinen <matti.kaasinen@gmail.com>
To: meta-arago@arago-project.org
Subject: linux-ti-staging-rt_4.1 does not create /sys/devices/system/cpu/cpu0/cpufreq directory
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
X-List-Received-Date: Fri, 15 Apr 2016 09:57:56 -0000
Content-Type: multipart/alternative; boundary=001a114a7fec8dffc30530830b1e

--001a114a7fec8dffc30530830b1e
Content-Type: text/plain; charset=UTF-8

Hi!

I can't verify/control Dynamic Voltage and Frequency Scaling on my am335x
based board as  /sys/devices/system/cpu/cpu0/cpufreq directory is not
created. I already asked this from TI e2e forum and thanks to hint from
there I found a problem from kernel configuration options. There is no
"Dynamic Frequency Scaling" option present in:
menuconfig tree: "System Type" -> "TI OMAP Common Features".

I tried this also without my own defconfig loaded with similar results.

I should have pretty recent meta-ti tree but not necessarily quite up-to
date. Should it need updated/do I need some kind of patching. Or is this
feature just not available in RT kernel?

Thanks,
Matti

--001a114a7fec8dffc30530830b1e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div>Hi!<br><br></div>I can&#39;t verify/control=
 Dynamic Voltage and Frequency Scaling on my am335x based board as=C2=A0 /s=
ys/devices/system/cpu/cpu0/cpufreq directory is not created. I already aske=
d this from TI e2e forum and thanks to hint from there I found a problem fr=
om kernel configuration options. There is no &quot;Dynamic Frequency Scalin=
g&quot; option present in:<br></div>menuconfig tree: &quot;System Type&quot=
; -&gt; &quot;TI OMAP Common Features&quot;.<br><br></div><div>I tried this=
 also without my own defconfig loaded with similar results.<br></div><div><=
br></div>I should have pretty recent meta-ti tree but not necessarily quite=
 up-to date. Should it need updated/do I need some kind of patching. Or is =
this feature just not available in RT kernel?<br><div><div><div><br></div><=
div>Thanks,<br></div><div>Matti<br></div></div></div></div>

--001a114a7fec8dffc30530830b1e--

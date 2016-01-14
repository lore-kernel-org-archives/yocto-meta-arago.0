Return-Path: <ankur.tyagi85@gmail.com>
Received: from mail-vk0-f49.google.com (mail-vk0-f49.google.com
	[209.85.213.49])
	by arago-project.org (Postfix) with ESMTPS id 63D7652A19
	for <meta-arago@arago-project.org>;
	Thu, 14 Jan 2016 11:40:49 +0000 (UTC)
Received: by mail-vk0-f49.google.com with SMTP id a123so248271367vkh.1
	for <meta-arago@arago-project.org>;
	Thu, 14 Jan 2016 03:40:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:from:date:message-id:subject:to:content-type;
	bh=uH2fG70xjO27tSWbMSR08SCJ1rqnDqW+670M9XCnMdo=;
	b=vfuqsI2ZV3O+LcE4nVMlQ5l02W4JdXsjW4D4ZH04TdGTP5wxsaPZ4LXoNXrUo/yDiy
	Wy1hgZJ6IsREno7A7Y3OzeD7T70h4np/Rj6wn5qRNKyYti/nM15AtSZ6QYFksy9/Q/QD
	vcpK9s4eQKXGFyVgBPyfwK/9Z6bJMTE1j4uQhVAgx2XRMZ1DB96xVzOp/X+EOHHLcY8H
	2lsZbphwpAIah15j1c1h85B9O25XKRmh9VSDjMAXzbVgrIUz6z2bXTyo0nHOXq/3vgvP
	n0DNzvNzBxg3uhnzJGZmYprPX0wr2hkk33ugLhfJaFqwI7zmrm7EDf50iRFhfn/LSbKu
	5v5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to
	:content-type;
	bh=uH2fG70xjO27tSWbMSR08SCJ1rqnDqW+670M9XCnMdo=;
	b=kcEQJDcyqWKB9yKc22aGRSulHbL/EUteO0P2vmLk+2bJbXYC9gCL/PXTwaPMSUBcPf
	xcVo1TMfk0t9VdFKmPQDFYGtfelQreqxniGCSgHc2Vy9Macn5d6w/uYmTIYKSDYvsRmx
	DjBnggXqwT5xQQsEdkN1h+9xRVqYXUCTxj7jqfCvCnkJyLwTy5ao9aFsAGZTWS/xcNU+
	PMCIgjGlCPPxYT4ttXlWfX++0t+KKFKNl7vtNnSxFb/6y817FIQ/KA/DZWIx1oeAZH+A
	JzthbbqI7iLF17EmD2ec22aGLn56rEHS3ts79f3tE5D1fZXAkAgPCq+EcC/fGvzkgX0b
	LJSw==
X-Gm-Message-State: ALoCoQl3jjRzKArzNbzeJxzT6lvNfQpGmCOiJLfvOjU0aLo++MC3fJND+W411eLAnC3W9thn32Pjf7LoPoHYAqxRLtwaABZYDg==
X-Received: by 10.31.147.82 with SMTP id v79mr2466345vkd.58.1452771648986;
	Thu, 14 Jan 2016 03:40:48 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.166.146 with HTTP; Thu, 14 Jan 2016 03:40:29 -0800 (PST)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Fri, 15 Jan 2016 00:40:29 +1300
Message-ID: <CADySD0HZ00Y+-6mrrvnetpEBJo44YgRJCHx1RQ7GVC51_ePSbw@mail.gmail.com>
To: meta-arago@arago-project.org
Subject: tisdk-rootfs-image error on fido branch
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
X-List-Received-Date: Thu, 14 Jan 2016 11:40:50 -0000
Content-Type: multipart/alternative; boundary=001a1141dca2141554052949c289

--001a1141dca2141554052949c289
Content-Type: text/plain; charset=UTF-8

Hi,

I am using arago-fido-config to build tisdk image and it fails with this
error:

Collected errors:
 * satisfy_dependencies_for: Cannot satisfy the following dependencies for
packagegroup-arago-test:
 *     liblzma5 (>= 5.2.0) *
 * opkg_install_cmd: Cannot install package packagegroup-arago-test.

Complete log @ http://pastebin.com/rVwYEEc0

thanks

--001a1141dca2141554052949c289
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<br><br>I am using arago-fido-config to build tisdk ima=
ge and it fails with this error:<br><br>Collected errors:<br>=C2=A0* satisf=
y_dependencies_for: Cannot satisfy the following dependencies for packagegr=
oup-arago-test:<br>=C2=A0* =C2=A0 =C2=A0 liblzma5 (&gt;=3D 5.2.0) *<br>=C2=
=A0* opkg_install_cmd: Cannot install package packagegroup-arago-test.<br><=
br>Complete log @ <a href=3D"http://pastebin.com/rVwYEEc0">http://pastebin.=
com/rVwYEEc0</a><br><br>thanks</div>

--001a1141dca2141554052949c289--

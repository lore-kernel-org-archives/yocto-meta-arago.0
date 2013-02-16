Return-Path: <paul.kovitz@welchallyn.com>
Received: from na3sys009aog107.obsmtp.com (na3sys009aog107.obsmtp.com
	[74.125.149.197])
	by arago-project.org (Postfix) with ESMTPS id B3AFF52A50
	for <meta-arago@arago-project.org>;
	Sat, 16 Feb 2013 00:27:00 +0000 (UTC)
Received: from mail-la0-f72.google.com ([209.85.215.72]) (using TLSv1) by
	na3sys009aob107.postini.com ([74.125.148.12]) with SMTP
	ID DSNKUR7SUtQlwh9rz6jSH+QdiK0iC22FxcBk@postini.com;
	Fri, 15 Feb 2013 16:27:00 PST
Received: by mail-la0-f72.google.com with SMTP id gw10so4971235lab.11
	for <meta-arago@arago-project.org>;
	Fri, 15 Feb 2013 16:26:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:x-gm-message-state;
	bh=ctmtkJEAgQFm1DK7tG/MZpvJoZu/CwClLqda0eJREI8=;
	b=c2bXtQVjhDsOt2PHHk/eX224d/YSEDB+zcrIrl3FPxiDTw/eg6S9ZnYypJ+9orLMfo
	zghJHPGS0OK2LXXFwqgvMsioeLU4gkTNdBvRm7vuHcp0nxulr2R+GNiD4b2eusxdVBU9
	NVe/YZfTEmGJELBTa4HvSsAvSQ5hXysLZ9lOd9OEyC+OVUIMHXTLn2846WpvpzfjuJVA
	74on7yqGnCsZSr4FXFkurbuochHpLF6T2Bu2QrNPqpcPhkK8SANbdlQEwv6ASl8yJqti
	dptQJP9zS3kem5PwkBW5jJ6E3cZgpt60UHmLgxgf0PQemI9BdAdNI+ZIVoWUH1iBsYac
	W9EQ==
X-Received: by 10.194.122.131 with SMTP id ls3mr7388843wjb.55.1360974417067;
	Fri, 15 Feb 2013 16:26:57 -0800 (PST)
X-Received: by 10.194.122.131 with SMTP id ls3mr7388834wjb.55.1360974416891;
	Fri, 15 Feb 2013 16:26:56 -0800 (PST)
MIME-Version: 1.0
Received: by 10.216.104.132 with HTTP; Fri, 15 Feb 2013 16:26:16 -0800 (PST)
In-Reply-To: <1360629979-24789-7-git-send-email-fcooper@ti.com>
References: <1360629979-24789-1-git-send-email-fcooper@ti.com>
	<1360629979-24789-7-git-send-email-fcooper@ti.com>
From: Paul Kovitz <paul.kovitz@welchallyn.com>
Date: Fri, 15 Feb 2013 16:26:16 -0800
Message-ID: <CA+edY+TJcTewZLGNf5WTjsZE3a+3cg0UCRBjaHPhtFQ344iM8Q@mail.gmail.com>
To: fcooperjr27@gmail.com
X-Gm-Message-State: ALoCoQkv1E0htMLRDqzzuUkHR6SkITKLuwkm+M0MizGDPbO6gegvxqJXrqadB76m65DaR5oZW57ZhdoMF2gj0A4+O+H53HqH8K9v9itzD5t53CY4u+PqX4tLJQ0Cr4Osxt+MvXBM+jxLPu9diT1XNjHbLY6pHUZJ7qNjbSsQNV0cmwlBnYoIhN8=
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>,
	"Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: Re: [PATCH 07/18] arago.conf: Add SUPPORTS_SGX variable
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
X-List-Received-Date: Sat, 16 Feb 2013 00:27:02 -0000
Content-Type: multipart/alternative; boundary=089e01229032aad07704d5cc8cff

--089e01229032aad07704d5cc8cff
Content-Type: text/plain; charset=ISO-8859-1

Please comment on coding SUPPORTS_SGX ?= "YES" instead of SUPPORTS_SGX =
"YES" For example, if you want to simulate an AM3352 device on an AM335x
eval board, you could write SUPPORTS_SGX = "NO" in local.conf. This change
requires a base_conditional checks for SUPPORTS_SGX in
task-arago-tisdk-matrix.bb and task-arago-tisdk-graphics-sdk-target.bb to
avoid other dependencies on OpenGL for the AM3352. I have a similar patch
in the code I am currently using for my own development.

Thanks for your help.

--089e01229032aad07704d5cc8cff
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Please comment on coding SUPPORTS_SGX ?=3D &quot;YES&quot;=
 instead of SUPPORTS_SGX =3D &quot;YES&quot; For example, if you want to si=
mulate an AM3352 device on an AM335x eval board, you could write=A0SUPPORTS=
_SGX =3D &quot;NO&quot; in local.conf. This change requires a base_conditio=
nal checks for SUPPORTS_SGX in=A0<a href=3D"http://task-arago-tisdk-matrix.=
bb" target=3D"_blank">task-arago-tisdk-matrix.bb</a> and=A0<a href=3D"http:=
//task-arago-tisdk-graphics-sdk-target.bb" target=3D"_blank">task-arago-tis=
dk-graphics-sdk-target.bb</a>=A0to avoid other dependencies on OpenGL for t=
he AM3352. I have a similar patch in the code I am currently using for my o=
wn development.<div>

<br></div><div>Thanks for your help.<br><div><div><div class=3D"gmail_extra=
">
<br><br><div class=3D"gmail_quote"><br></div>
</div></div></div></div></div>

--089e01229032aad07704d5cc8cff--

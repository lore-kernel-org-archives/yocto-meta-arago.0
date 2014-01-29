Return-Path: <samant.uvaca@gmail.com>
Received: from mail-qa0-f53.google.com (mail-qa0-f53.google.com
	[209.85.216.53])
	by arago-project.org (Postfix) with ESMTPS id 7E415529BC
	for <meta-arago@arago-project.org>;
	Wed, 29 Jan 2014 17:51:43 +0000 (UTC)
Received: by mail-qa0-f53.google.com with SMTP id cm18so2900298qab.12
	for <meta-arago@arago-project.org>;
	Wed, 29 Jan 2014 09:51:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=7FCvIhsn2rQaUM1j07iZbPDXPLAgs3I324+cSrcUjWA=;
	b=0xsX3yKm90MgEiL3vqaVjN/NHBS5qhYdeaxNiMkWpYhx9C6OSG5NkUaV97AFgl2AkR
	pPTCSin0Ko7I50/HPkitIEyvvzsiCyVsFDd2W83lTUhDKXZZbVMUV/HQBI+nA6K2b39J
	v/8UAK7x0N9L81ddADQg907EuG8q63EBLWumnoBroLK6kF+szDWs2k4r6jT8INcQKtQY
	HHJ6gCYoGm0QUj2YMnMX+0gNFrMOv6/HS/aIVrvlEFBDXr8Upv4brTtr0mdn6eR6GtGZ
	IwYshinUnKE55uk70/VLNM1RZz7fDILaQ2aB+kJAYwpbX8sS00kxP1QHunWYDow1GgkB
	+Jlg==
MIME-Version: 1.0
X-Received: by 10.224.165.133 with SMTP id i5mr14432436qay.75.1391017902212;
	Wed, 29 Jan 2014 09:51:42 -0800 (PST)
Received: by 10.229.138.196 with HTTP; Wed, 29 Jan 2014 09:51:42 -0800 (PST)
Received: by 10.229.138.196 with HTTP; Wed, 29 Jan 2014 09:51:42 -0800 (PST)
In-Reply-To: <20140129170711.GQ6814@edge>
References: <CA+B-G-jDW=-RBE7ZWUMS7fLiHOdMc0uquHRZS+yF=+uRX0qMMQ@mail.gmail.com>
	<CA+B-G-hPSwxU-TkOQyxXw=Hd=7G8kS+cW5VGxGxLca0Rn4j8iw@mail.gmail.com>
	<20140129170711.GQ6814@edge>
Date: Wed, 29 Jan 2014 09:51:42 -0800
Message-ID: <CA+B-G-g4H98UmrXvEpi8N1AaECq6n0vvUrCzA2k+q_Qbn3k3gA@mail.gmail.com>
From: Samant Kumar <samant.uvaca@gmail.com>
To: Denys Dmytriyenko <denys@ti.com>
Cc: meta-arago@arago-project.org, meta-ti@yactoproject.org
Subject: Re: DM816x-evm
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
X-List-Received-Date: Wed, 29 Jan 2014 17:51:43 -0000
Content-Type: multipart/alternative; boundary=089e0149c6c0f0259d04f11f9796

--089e0149c6c0f0259d04f11f9796
Content-Type: text/plain; charset=ISO-8859-1

Thanks Denys.
On Wed, Jan 29, 2014 at 08:35:54AM -0800, Samant Kumar wrote:
> Hi Denys,
> I couldn't find any MACHINE conf for dm816x-evm or c6a816x-evm? Is there
> special tree/branch for support for Netra? I want to use arago software
> infrastructure for Netra s/w development.

Samant,

Unfortunately, support for TI81x platforms was removed from meta-ti some
time
ago:

http://thread.gmane.org/gmane.linux.embedded.yocto.meta-ti/1544/focus=1545

There were numerous discussions on this topic on meta-ti mailing list - you
might want to take a look...

--
Denys

--089e0149c6c0f0259d04f11f9796
Content-Type: text/html; charset=ISO-8859-1

<p>Thanks Denys.</p>
<div class="gmail_quot&lt;blockquote class=" style="margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Wed, Jan 29, 2014 at 08:35:54AM -0800, Samant Kumar wrote:<br>
&gt; Hi Denys,<br>
&gt; I couldn&#39;t find any MACHINE conf for dm816x-evm or c6a816x-evm? Is there<br>
&gt; special tree/branch for support for Netra? I want to use arago software<br>
&gt; infrastructure for Netra s/w development.<br>
<br>
Samant,<br>
<br>
Unfortunately, support for TI81x platforms was removed from meta-ti some time<br>
ago:<br>
<br>
<a href="http://thread.gmane.org/gmane.linux.embedded.yocto.meta-ti/1544/focus=1545" target="_blank">http://thread.gmane.org/gmane.linux.embedded.yocto.meta-ti/1544/focus=1545</a><br>
<br>
There were numerous discussions on this topic on meta-ti mailing list - you<br>
might want to take a look...<br>
<br>
--<br>
Denys<br>
</div>

--089e0149c6c0f0259d04f11f9796--

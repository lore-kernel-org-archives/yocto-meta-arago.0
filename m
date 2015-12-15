Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id DC03E5208B
	for <meta-arago@arago-project.org>;
	Tue, 15 Dec 2015 15:52:29 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id tBFFqTlY029761;
	Tue, 15 Dec 2015 09:52:29 -0600
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id tBFFqTBI009197;
	Tue, 15 Dec 2015 09:52:29 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 15 Dec 2015 09:52:28 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id tBFFqS2O004111;
	Tue, 15 Dec 2015 09:52:28 -0600
Date: Tue, 15 Dec 2015 10:52:13 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Ankur Tyagi <ankur.tyagi85@gmail.com>
Message-ID: <20151215155212.GB23133@edge>
References: <CADySD0GvzsFS2gdsxhkvXAzRk2NTaGP0hiAX0=eiGDSRy9uz4w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CADySD0GvzsFS2gdsxhkvXAzRk2NTaGP0hiAX0=eiGDSRy9uz4w@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: QT5 application NOT generating core dump upon receiving segmentation fault
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
X-List-Received-Date: Tue, 15 Dec 2015 15:52:30 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Sounds like you have a size limit for core dumps:
http://bfy.tw/3IS1

-- 
Denys


On Tue, Dec 15, 2015 at 11:26:41PM +1300, Ankur Tyagi wrote:
>  Hi,
> 
> I am running a QT5 based application on TI AM335x EVM kit. I am using
> meta-arago daisy configuration.
> 
> My system is configured to generate core dump and core dumps are generated
> whenever application receives segmentation fault (expected).
> 
> But when my QT5 based application received SIGSEGV, then no core dump is
> generated. It dies without "Segmentation fault" message on stdout.
> 
> To debug this further, I added nullptr dereference in my application main()
> before QApplication object is created and when executed, core dump was
> created.
> When I moved nullptr dereference after QApplication object is created, then
> no core dump was created. Application died without any message.
> 
> So it seems QT is handling SIGSEGV and not allowing to create core dump.
> 
> Is it expected ? I believe not. What wrong am I doing and how to fix this ?
> 
> thanks
> Ankur

> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago



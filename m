Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 78FF652A5B
	for <meta-arago@arago-project.org>;
	Mon,  5 Nov 2012 15:19:00 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id qA5FIxNu008201
	for <meta-arago@arago-project.org>; Mon, 5 Nov 2012 09:18:59 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id qA5FIxqf029474
	for <meta-arago@arago-project.org>; Mon, 5 Nov 2012 09:18:59 -0600
Received: from dlelxv22.itg.ti.com (172.17.1.197) by dfle72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.1.323.3;
	Mon, 5 Nov 2012 09:18:59 -0600
Received: from localhost ([158.218.102.158])	by dlelxv22.itg.ti.com
	(8.13.8/8.13.8) with ESMTP id qA5FIx2k013228;
	Mon, 5 Nov 2012 09:18:59 -0600
Date: Mon, 5 Nov 2012 10:18:59 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>
Message-ID: <20121105151858.GA8311@edge>
References: <8F29D6B095ED194EA1980491A5E029710C315A45@DFLE09.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <8F29D6B095ED194EA1980491A5E029710C315A45@DFLE09.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: Switch from tar.bz2 to tar.gz
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
X-List-Received-Date: Mon, 05 Nov 2012 15:19:00 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Actually, neither gzip nor bzip2 use multiple threads, so it's running on a 
single core and won't benefit from 24 or even 124 cores...

Other than that, I don't mind switching to gzip for speed, slightly losing in 
size.

Denys


On Sun, Nov 04, 2012 at 02:06:01PM +0000, Cooper Jr., Franklin wrote:
> In our current setup tar.bz2 is the default file type used by image recipes. In classic arago we used tar.gz.
> 
> I was always curious why some of the image builds were taking a long time. I also noticed that installing the SDK using the installer also took a very long time.
> 
> I took arago-amsdk-image contents and created and extracted tar.gz and tar.bz2 files and timed the results.
> 
> extract tar.bz2
> real    2m20.402s
> user    2m15.800s
> sys     0m9.410s
> 
> extract tar.gz
> real    0m47.641s
> user    0m34.850s
> sys     0m10.860s
> 
> create tar.gz
> real    1m49.561s
> user    1m39.130s
> sys     0m4.420s
> 
> create tar.bz2
> real    6m10.851s
> user    6m8.490s
> sys     0m4.420s
> 
> It seems tar.bz2 provides better compression at the cost of extraction and compression speed. From a SDK perspective  some savings in size is not worth a significant increase in time to bitbake image recipes and neither is it worth the extra time to install a full blown SDK. I would also note that these test are done on a 24 core machine. I'm unsure how much these different compression algorithms utilize all the different cores but I am sure times on a traditional machine will be significantly longer. So is there any issue with me changing the default file type for images from tar.bz2 to tar.gz?
> 
> 
> Regards,
> Franklin Cooper Jr.
> Texas Instruments
> Application Engineer
> fcooper@ti.com<mailto:fcooper@ti.com>
> 

> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago



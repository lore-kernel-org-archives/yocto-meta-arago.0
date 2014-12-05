Return-Path: <karthik.ramanan@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id AE2BE520EA
	for <meta-arago@arago-project.org>;
	Fri,  5 Dec 2014 07:01:36 +0000 (UTC)
Received: from dbdlxv05.itg.ti.com ([172.24.171.60])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id sB571YBK031522
	for <meta-arago@arago-project.org>; Fri, 5 Dec 2014 01:01:35 -0600
Received: from DBDE72.ent.ti.com (dbdmailx.itg.ti.com [172.24.171.97])
	by dbdlxv05.itg.ti.com (8.14.3/8.13.8) with ESMTP id sB571WQK005752
	for <meta-arago@arago-project.org>; Fri, 5 Dec 2014 12:31:33 +0530
Received: from [172.24.157.106] (172.24.157.106) by DBDE72.ent.ti.com
	(172.24.171.97) with Microsoft SMTP Server (TLS) id 14.3.174.1;
	Fri, 5 Dec 2014 12:31:31 +0530
Message-ID: <5481584B.6050206@ti.com>
Date: Fri, 5 Dec 2014 12:31:31 +0530
From: Karthik Ramanan <a0393906@ti.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:17.0) Gecko/20130620 Thunderbird/17.0.7
MIME-Version: 1.0
To: Denys Dmytriyenko <denys@ti.com>
References: <1416990689-13265-1-git-send-email-a0393906@ti.com>
	<20141203014525.GI5113@edge>
In-Reply-To: <20141203014525.GI5113@edge>
X-Originating-IP: [172.24.157.106]
Cc: meta-arago@arago-project.org
Subject: Re: [for master PATCH] gstreamer: Add missing FILES_PN to populate rootfs
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
X-List-Received-Date: Fri, 05 Dec 2014 07:01:37 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 03-Dec-14 7:15 AM, Denys Dmytriyenko wrote:
> On Wed, Nov 26, 2014 at 02:01:28PM +0530, Karthik Ramanan wrote:
>> All the libraries and binaries from GST, base-plugins,
>> good-plugins and bad-plugins need to be populated into
>> the target filesystem.
>
> NAK - this is not the correct way to do what you explain here!
>
> The code I've added to this .inc file splits out all the libraries and plugins
> into individual packages, similar to how it's done in the upstream gstreamer
> recipes:
>
> http://arago-project.org/git/?p=meta-arago.git;a=commitdiff;h=75b485f1208f605dd7da70bf61b0a078c9c863a8
>
>
> You need to list necessary library packages in the corresponding packagegroup
> to be added to the target filesystem. Or, alternatively, you can pull a "meta"
> package that lists all produced libraries and plugins. packagegroup-arago-gst
> does that already - it includes all gst-plugins-*-meta and that should already
> be set to point to the corresponding "mm-accel" packages with necessary
> PREFERRED_PROVIDER statements in arago-prefs.inc
>
>
> Moreover, I don't see any files not being packaged, which would need to be
> picked up by your below FILES_* statement. The only warning I see from bitbake
> as related to gstreamer, are:
>
> WARNING: QA Issue: gst-plugins-ducati: Files/directories were installed but not shipped
>    /usr/lib/gstreamer-0.10/.debug
>    /usr/lib/gstreamer-0.10/.debug/libgstducati.so
> WARNING: QA Issue: gst-plugins-vpe: Files/directories were installed but not shipped
>    /usr/lib/gstreamer-0.10/.debug
>    /usr/lib/gstreamer-0.10/.debug/libgstvpe.so
>    /usr/lib/gstreamer-0.10/.debug/libgstperf.so
>
>
> So, the question would be - what are you trying to fix here?
>

Denys,

I tried your suggestion by making changes to the packagegroup to include 
"packagegroup-arago-gst" and it worked fine. I will abandon this patch. 
Thanks for your input.

Regards
Karthik


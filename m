Return-Path: <karthik.ramanan@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 2275E529A9
	for <meta-arago@arago-project.org>;
	Fri, 10 Apr 2015 12:52:55 +0000 (UTC)
Received: from dbdlxv05.itg.ti.com ([172.24.171.60])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t3ACqqdc027291
	for <meta-arago@arago-project.org>; Fri, 10 Apr 2015 07:52:53 -0500
Received: from DBDE72.ent.ti.com (dbdmailx.itg.ti.com [172.24.171.97])
	by dbdlxv05.itg.ti.com (8.14.3/8.13.8) with ESMTP id t3ACqnUa027427
	for <meta-arago@arago-project.org>; Fri, 10 Apr 2015 18:22:50 +0530
Received: from [172.24.158.135] (172.24.158.135) by DBDE72.ent.ti.com
	(172.24.171.97) with Microsoft SMTP Server (TLS) id 14.3.224.2;
	Fri, 10 Apr 2015 18:22:49 +0530
Message-ID: <5527C7A0.80700@ti.com>
Date: Fri, 10 Apr 2015 18:22:48 +0530
From: Karthik Ramanan <a0393906@ti.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: Denys Dmytriyenko <denys@ti.com>
References: <1428582873-438-1-git-send-email-a0393906@ti.com>
	<20150409211614.GB6414@edge>
In-Reply-To: <20150409211614.GB6414@edge>
X-Originating-IP: [172.24.158.135]
Cc: meta-arago@arago-project.org
Subject: Re: weston: Add custom profile into targetfs
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
X-List-Received-Date: Fri, 10 Apr 2015 12:52:55 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 10-Apr-15 2:46 AM, Denys Dmytriyenko wrote:
> Karthik,
>
> Looks better. Now, can you just merge the existing wayland_env and the new
> profile you are adding? Both of them are installed in /etc/profile.d and get
> sourced on every login. Just add the mkdir and chmod part to the end of
> existing wayland_env.sh and that's it. Also, since you are changing wayldn_env
> file anyway, set XDG_RUNTIME_DIR to the same value of /tmp/${UID}-runtime-dir?
>

Denys,

Thanks for the feedback. I have incorporated all the suggestions in 
PATCH v3.

Regards
Karthik


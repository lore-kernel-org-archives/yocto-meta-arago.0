Return-Path: <pierluigi.passaro@phoenixsoftware.it>
Received: from smtpcmd01231.aruba.it (smtpdg5.aruba.it [62.149.158.235])
	by arago-project.org (Postfix) with ESMTP id 470E052976
	for <meta-arago@arago-project.org>;
	Thu, 26 Nov 2015 11:23:12 +0000 (UTC)
Received: from [192.168.1.72] ([94.33.39.20])
	by smtpcmd05.ad.aruba.it with bizsmtp
	id mBP91r01R0S5K6601BP9tK; Thu, 26 Nov 2015 12:23:10 +0100
To: meta-arago@arago-project.org
From: Pierluigi Passaro <pierluigi.passaro@phoenixsoftware.it>
Message-ID: <5656EB9D.2030702@phoenixsoftware.it>
Date: Thu, 26 Nov 2015 12:23:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
Subject: Failing to fetch dt-source.tar.gz
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
X-List-Received-Date: Thu, 26 Nov 2015 11:23:14 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi all,
playing with processor-sdk-02.00.00.00-config, I'm experiencing a 
problem fetching dt-source.tar.gz

The file is not available from the original SRC_URI:
SRC_URI = 
"http://home.comcast.net/~SCSIguy/SCSI_FAQ/RMiller_Tools/ftp/dt/dt-source.tar.gz
but via a mirror downloading an older (2007) version.

I've seen that the right file appeared on November 10 in 
http://arago-project.org/files/sources/

Would it be a permanent place where to point a patched recipes o a 
bbappend ?

Thanks
Regards
Pierluigi Passaro


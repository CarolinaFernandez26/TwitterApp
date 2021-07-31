//
//  TweetCellTableViewCell.swift
//  Twitter
//
//  Created by Carolina Fernandez on 7/23/21.
//  Copyright © 2021 Dan. All rights reserved.
//

import UIKit

class TweetCellTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var profileImageView: UIImageView!
    
    @IBOutlet weak var userNameLabel: UILabel!
    
    @IBOutlet weak var tweetContent: UILabel!
    
    @IBOutlet weak var favButton: UIButton!
    
    @IBOutlet weak var retweetButton: UIButton!
    
    var favorited:Bool = false
    
    var tweetId:Int = -1
    
    @IBAction func favoriteTweet(_ sender: Any) {
   
        //if something was already favorited, it will unfavorite
        //favorited is the current state so we flip it
        let tobeFavorited = !favorited
        if (tobeFavorited)
        {
            TwitterAPICaller.client?.favoriteTweet(tweetId: tweetId, success:
          {
            self.setFavorited(true)// changes colors
          }, failure: { (error)  in
                print ("Favorite did not succeed: \(error)")
          })
        
        }else
        {
            TwitterAPICaller.client?.unfavoriteTweet(tweetId: tweetId,  success:{ self.setFavorited(false)
                
            } , failure: {(error) in
                    print ("Unfavorite did not succeed: \(error)")
            })
        }
        
    }
    
   
    
    func setFavorited(_ isFavorited:Bool)
    {
        favorited = isFavorited
        if (favorited) {
            favButton.setImage(UIImage(named: "favor-icon"), for: UIControl.State.normal)
        }
        else {
            favButton.setImage(UIImage(named:"favor-icon-1"), for: UIControl.State.normal)
        }
    }
    func setRetweeted(_ isRetweeted: Bool)
    {if (isRetweeted) {
        retweetButton.setImage( UIImage(named: "retweet-icon-green"), for: UIControl.State.normal)
        //turn off button after retweeted
        retweetButton.isEnabled = false
    }
        else {
            retweetButton.setImage( UIImage(named: "retweet-icon"), for: UIControl.State.normal)
            //turn on button after not retweeted
            retweetButton.isEnabled = true
    }
        
    }
    
    @IBAction func retweetTweet(_ sender: Any) {
        TwitterAPICaller.client?.retweet(tweetId: tweetId, success: {
            self.setRetweeted(true)
        }, failure:{ (error) in print ("Error in retweeting: \(error)")
        })
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

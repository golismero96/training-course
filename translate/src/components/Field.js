import React from 'react';


const Field = () => {
    return (
        <div className='ui field'>
            <label htmlFor="name">Name </label>
            <input id="name" className="input ui info" />
        </div>
    );
};


export default Field;